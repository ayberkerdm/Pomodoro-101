import 'package:freezed_annotation/freezed_annotation.dart';
import '../../tasks/models/task.dart';
import 'timer_mode.dart';

part 'timer_state.freezed.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    @Default(TimerMode.pomodoro) TimerMode mode,
    
    @Default(25 * 60) int initialDuration,
    @Default(25 * 60) int remainingTime,
    
    @Default(false) bool isRunning,
    
    @Default(1) int currentSession,
    
    Task? activeTask,
    
    /// Arka planda çalışırken gerçek zamanı izleyebilmek için bitiş zamanı hedefi
    DateTime? targetEndTime,
  }) = _TimerState;
  
  const TimerState._();
  
  double get progress {
    if (initialDuration == 0) return 0;
    return remainingTime / initialDuration;
  }
}
