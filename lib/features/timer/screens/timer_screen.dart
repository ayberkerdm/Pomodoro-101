import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/timer_notifier.dart';
import '../widgets/circular_timer.dart';
import '../widgets/timer_controls.dart';

import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../settings/providers/settings_provider.dart';
import '../../../core/theme/theme_palettes.dart';
import '../models/timer_mode.dart';

class TimerScreen extends ConsumerStatefulWidget {
  const TimerScreen({super.key});

  @override
  ConsumerState<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends ConsumerState<TimerScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(timerNotifierProvider.notifier).initializeSettings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final timerState = ref.watch(timerNotifierProvider);
    final notifier = ref.read(timerNotifierProvider.notifier);
    final settings = ref.watch(settingsProvider);
    final palette = TimerPalette.fromId(settings.customBackgroundColor);

    final bool isGradient = palette?.isGradient == true;
    final List<Color> bgColors = isGradient 
        ? palette!.backgroundGradient 
        : [palette?.backgroundColor ?? theme.scaffoldBackgroundColor, palette?.backgroundColor ?? theme.scaffoldBackgroundColor];

    return Scaffold(
      backgroundColor: Colors.transparent, // Arka planı Container devralacak
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Pomodoro',
          style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 24,
            color: palette != null ? Colors.white : null,
          ),
        ),
        centerTitle: true,
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.settings);
            },
            icon: Icon(Icons.settings_rounded, color: palette != null ? Colors.white : null),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: bgColors,
          ),
        ),
        child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // --- Mod Seçiciler (Pill) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _modePill(
                    context,
                    title: 'Odaklan',
                    minutes: settings.pomodoroLength,
                    isSelected: timerState.mode == TimerMode.pomodoro,
                    palette: palette,
                    onTap: () => notifier.setMode(TimerMode.pomodoro),
                  ),
                  _modePill(
                    context,
                    title: 'Kısa Mola',
                    minutes: settings.shortBreakLength,
                    isSelected: timerState.mode == TimerMode.shortBreak,
                    palette: palette,
                    onTap: () => notifier.setMode(TimerMode.shortBreak),
                  ),
                  _modePill(
                    context,
                    title: 'Uzun Mola',
                    minutes: settings.longBreakLength,
                    isSelected: timerState.mode == TimerMode.longBreak,
                    palette: palette,
                    onTap: () => notifier.setMode(TimerMode.longBreak),
                  ),
                ],
              ),
              
              const Spacer(flex: 2),
              
              // Ana Sayaç Grafiği
              const Center(child: CircularTimer()),
              
              const SizedBox(height: 32),
              
              // Hazır mısın? Metni
              Text(
                timerState.isRunning 
                    ? (timerState.mode == TimerMode.pomodoro ? 'Odaklanma vakti!' : 'Mola vakti!')
                    : 'Hazır mısın?',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: palette != null ? Colors.white70 : theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 3),
              
              // Buton Grubu
              const TimerControls(),
              
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _modePill(
    BuildContext context, {
    required String title,
    required int minutes,
    required bool isSelected,
    required TimerPalette? palette,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    
    final defaultBgColor = isSelected ? Colors.white : theme.colorScheme.onSurface.withValues(alpha: 0.1);
    final defaultTextColor = isSelected ? const Color(0xFF1C2299) : theme.colorScheme.onSurface;

    final bgColor = palette != null 
        ? (isSelected ? palette.activePillBg : palette.inactivePillBg)
        : defaultBgColor;

    final textColor = palette != null
        ? (isSelected ? palette.activePillText : Colors.white)
        : defaultTextColor;

    final borderColor = isSelected 
        ? (palette != null ? Colors.transparent : Colors.white) 
        : (palette != null ? Colors.white30 : Colors.transparent);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '$minutes dk',
              style: TextStyle(
                color: textColor.withValues(alpha: 0.7),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
