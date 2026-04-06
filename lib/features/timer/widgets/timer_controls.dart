import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/timer_notifier.dart';
import '../../settings/providers/settings_provider.dart';
import '../../../core/theme/theme_palettes.dart';

class TimerControls extends ConsumerWidget {
  const TimerControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final notifier = ref.read(timerNotifierProvider.notifier);
    final settings = ref.watch(settingsProvider);
    final palette = TimerPalette.fromId(settings.customBackgroundColor);
    final isRunning = timerState.isRunning;

    // Koyu mor buton rengi (Varsayılan Görsel)
    final defaultButtonBg = const Color(0xFFAD7BFF);

    return SizedBox(
      width: 220,
      height: 64,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: palette != null ? palette.buttonBg : defaultButtonBg,
          foregroundColor: palette != null ? palette.buttonText : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          elevation: 0,
        ),
        onPressed: () {
          if (isRunning) {
            notifier.pause();
          } else {
            notifier.start();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
              size: 28,
            ),
            const SizedBox(width: 12),
            Text(
              isRunning ? 'DURAKLAT' : 'BAŞLAT',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
