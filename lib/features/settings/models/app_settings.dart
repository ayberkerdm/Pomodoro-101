class AppSettings {
  final int pomodoroLength;
  final int shortBreakLength;
  final int longBreakLength;
  final int longBreakInterval;
  final bool autoStartBreaks;
  final bool autoStartPomodoros;
  final int? customBackgroundColor;

  const AppSettings({
    this.pomodoroLength = 25,
    this.shortBreakLength = 5,
    this.longBreakLength = 15,
    this.longBreakInterval = 4,
    this.autoStartBreaks = true,
    this.autoStartPomodoros = false,
    this.customBackgroundColor,
  });

  AppSettings copyWith({
    int? pomodoroLength,
    int? shortBreakLength,
    int? longBreakLength,
    int? longBreakInterval,
    bool? autoStartBreaks,
    bool? autoStartPomodoros,
    int? customBackgroundColor,
  }) {
    return AppSettings(
      pomodoroLength: pomodoroLength ?? this.pomodoroLength,
      shortBreakLength: shortBreakLength ?? this.shortBreakLength,
      longBreakLength: longBreakLength ?? this.longBreakLength,
      longBreakInterval: longBreakInterval ?? this.longBreakInterval,
      autoStartBreaks: autoStartBreaks ?? this.autoStartBreaks,
      autoStartPomodoros: autoStartPomodoros ?? this.autoStartPomodoros,
      customBackgroundColor: customBackgroundColor ?? this.customBackgroundColor,
    );
  }
}
