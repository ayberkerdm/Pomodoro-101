import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_settings.dart';

class SettingsRepository {
  final SharedPreferences _prefs;

  SettingsRepository(this._prefs);

  static const String _keyPomodoroLen = 'pomodoroLength';
  static const String _keyShortBreakLen = 'shortBreakLength';
  static const String _keyLongBreakLen = 'longBreakLength';
  static const String _keyLongBreakInterval = 'longBreakInterval';
  static const String _keyAutoStartBreaks = 'autoStartBreaks';
  static const String _keyAutoStartPomodoros = 'autoStartPomodoros';
  static const String _keyCustomBgColor = 'customBackgroundColor';

  AppSettings getSettings() {
    return AppSettings(
      pomodoroLength: _prefs.getInt(_keyPomodoroLen) ?? 25,
      shortBreakLength: _prefs.getInt(_keyShortBreakLen) ?? 5,
      longBreakLength: _prefs.getInt(_keyLongBreakLen) ?? 15,
      longBreakInterval: _prefs.getInt(_keyLongBreakInterval) ?? 4,
      autoStartBreaks: _prefs.getBool(_keyAutoStartBreaks) ?? true,
      autoStartPomodoros: _prefs.getBool(_keyAutoStartPomodoros) ?? false,
      customBackgroundColor: _prefs.getInt(_keyCustomBgColor),
    );
  }

  Future<void> saveSettings(AppSettings settings) async {
    await _prefs.setInt(_keyPomodoroLen, settings.pomodoroLength);
    await _prefs.setInt(_keyShortBreakLen, settings.shortBreakLength);
    await _prefs.setInt(_keyLongBreakLen, settings.longBreakLength);
    await _prefs.setInt(_keyLongBreakInterval, settings.longBreakInterval);
    await _prefs.setBool(_keyAutoStartBreaks, settings.autoStartBreaks);
    await _prefs.setBool(_keyAutoStartPomodoros, settings.autoStartPomodoros);
    if (settings.customBackgroundColor != null) {
      await _prefs.setInt(_keyCustomBgColor, settings.customBackgroundColor!);
    } else {
      await _prefs.remove(_keyCustomBgColor);
    }
  }
}
