import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/timer_state.dart';
import '../models/timer_mode.dart';
import '../../../core/services/audio_service.dart';
import '../../../core/services/vibration_service.dart';
import '../../../core/services/wakelock_service.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/providers/repository_providers.dart';
import '../../settings/providers/settings_provider.dart';
import '../../settings/models/app_settings.dart';
import '../../history/models/session_record.dart';
import '../../tasks/models/task.dart';

part 'timer_notifier.g.dart';

@Riverpod(keepAlive: true)
class TimerNotifier extends _$TimerNotifier {
  Timer? _timer;
  DateTime? _sessionStartTime; // Başlangıç zamanı veritabanı kaydı için

  @override
  TimerState build() {
    ref.listen(settingsProvider, (previous, next) {
      if (!state.isRunning) {
        final newInitial = _getDurationForMode(state.mode, settings: next);
        state = state.copyWith(
          initialDuration: newInitial,
          remainingTime: newInitial,
        );
      }
    });
    return const TimerState(); // Sonradan init fırlatacağız
  }

  void initializeSettings() {
    final settings = ref.read(settingsRepositoryProvider).getSettings();
    final int pomodoroSeconds = settings.pomodoroLength * 60;
    state = state.copyWith(
      initialDuration: pomodoroSeconds,
      remainingTime: pomodoroSeconds,
      mode: TimerMode.pomodoro,
    );
  }

  void setActiveTask(Task task) {
    state = state.copyWith(activeTask: task);
  }

  void start() {
    if (state.isRunning) return;

    WakelockService.instance.enable();
    AudioService.instance.playTickSound();

    final now = DateTime.now();
    _sessionStartTime ??= now;

    // Gerçek zaman hedefini belirle
    final target = now.add(Duration(seconds: state.remainingTime));

    state = state.copyWith(
      isRunning: true,
      targetEndTime: target,
    );

    _timer = Timer.periodic(const Duration(seconds: 1), _tick);
  }

  void pause() {
    if (!state.isRunning) return;

    WakelockService.instance.disable();
    _timer?.cancel();

    state = state.copyWith(
      isRunning: false,
      targetEndTime: null, // Pause olduğu için hedefe doğru geri sayım durur.
    );
  }

  void skip() {
    _timer?.cancel();
    _finishSession(skipped: true);
  }

  void reset() {
    _timer?.cancel();
    WakelockService.instance.disable();
    
    _sessionStartTime = null;
    
    // Geçerli modun başlangıç süresine geri dön
    final initial = _getDurationForMode(state.mode);
    state = state.copyWith(
      isRunning: false,
      remainingTime: initial,
      initialDuration: initial,
      targetEndTime: null,
    );
  }

  void setMode(TimerMode mode) {
    if (state.mode == mode) return;

    _timer?.cancel();
    WakelockService.instance.disable();
    _sessionStartTime = null;

    final initial = _getDurationForMode(mode);
    state = state.copyWith(
      mode: mode,
      isRunning: false,
      remainingTime: initial,
      initialDuration: initial,
      targetEndTime: null,
    );
  }

  void _tick(Timer timer) {
    if (state.targetEndTime == null) return;

    final now = DateTime.now();
    final remaining = state.targetEndTime!.difference(now).inSeconds;

    if (remaining <= 0) {
      // Süre bitti
      _timer?.cancel();
      
      // Bildirim ve Geri bildirimler
      _showSessionCompleteNotification();
      AudioService.instance.playRingSound();
      VibrationService.instance.vibrateHeavy();
      
      _finishSession(skipped: false);
    } else {
      state = state.copyWith(remainingTime: remaining);
    }
  }

  void _showSessionCompleteNotification() {
    String title = 'Süre Doldu!';
    String body = '';

    switch (state.mode) {
      case TimerMode.pomodoro:
        body = 'Odaklanma seansı bitti. Mola verme zamanı!';
        break;
      case TimerMode.shortBreak:
      case TimerMode.longBreak:
        body = 'Mola bitti. Tekrar odaklanmaya hazır mısın?';
        break;
    }

    NotificationService.instance.showLocalNotification(
      id: 0,
      title: title,
      body: body,
    );
  }

  Future<void> _finishSession({required bool skipped}) async {
    final settings = ref.read(settingsRepositoryProvider).getSettings();
    
    // 1. Veritabanına kaydet
    if (_sessionStartTime != null) {
      final record = SessionRecord()
        ..startTime = _sessionStartTime!
        ..endTime = DateTime.now()
        ..sessionType = state.mode.name
        ..durationMinutes = state.initialDuration ~/ 60
        ..durationSeconds = state.initialDuration - (skipped ? state.remainingTime : 0)
        ..wasInterrupted = skipped;
        
      if (state.activeTask != null) {
        record.task.value = state.activeTask;
        
        // Eğer bir görev varsa ve pomodoro tamamlandıysa, görevin sayacını artır
        if (!skipped && state.mode == TimerMode.pomodoro) {
          final task = state.activeTask!;
          task.completedPomodoros++;
          if (task.completedPomodoros >= task.targetPomodoros) {
            task.isCompleted = true;
            task.completedAt = DateTime.now();
          }
          await ref.read(taskRepositoryProvider).saveTask(task);
        }
      }
      
      await ref.read(sessionRepositoryProvider).saveSession(record);
    }

    _sessionStartTime = null;
    WakelockService.instance.disable();

    // 2. Bir sonraki modu belirle
    TimerMode nextMode = state.mode;
    int nextSession = state.currentSession;
    bool autoStart = false;

    if (state.mode == TimerMode.pomodoro) {
      // Pomodoro bitti -> Mola
      if (state.currentSession % settings.longBreakInterval == 0) {
        nextMode = TimerMode.longBreak;
      } else {
        nextMode = TimerMode.shortBreak;
      }
      autoStart = settings.autoStartBreaks;
      nextSession++;
    } else {
      // Mola bitti -> Pomodoro
      nextMode = TimerMode.pomodoro;
      autoStart = settings.autoStartPomodoros;
    }

    final int nextDuration = _getDurationForMode(nextMode);

    state = state.copyWith(
      mode: nextMode,
      isRunning: autoStart,
      remainingTime: nextDuration,
      initialDuration: nextDuration,
      currentSession: nextSession,
      targetEndTime: autoStart ? DateTime.now().add(Duration(seconds: nextDuration)) : null,
    );

    if (autoStart) {
      start();
    }
  }

  int _getDurationForMode(TimerMode mode, {AppSettings? settings}) {
    final activeSettings = settings ?? ref.read(settingsRepositoryProvider).getSettings();
    switch (mode) {
      case TimerMode.pomodoro:
        return activeSettings.pomodoroLength * 60;
      case TimerMode.shortBreak:
        return activeSettings.shortBreakLength * 60;
      case TimerMode.longBreak:
        return activeSettings.longBreakLength * 60;
    }
  }
}
