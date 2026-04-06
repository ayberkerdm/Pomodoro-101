import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/timer_notifier.dart';
import '../../settings/providers/settings_provider.dart';
import '../../../core/theme/theme_palettes.dart';
import 'circular_timer_painter.dart';

class CircularTimer extends ConsumerWidget {
  const CircularTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final settings = ref.watch(settingsProvider);
    final theme = Theme.of(context);
    final palette = TimerPalette.fromId(settings.customBackgroundColor);

    // Kalan zamanı formatla (MM:SS)
    final minutes = (timerState.remainingTime ~/ 60).toString().padLeft(2, '0');
    final seconds = (timerState.remainingTime % 60).toString().padLeft(2, '0');

    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // SVG / Painter Arka Plan
          SizedBox.expand(
            child: CustomPaint(
              painter: CircularTimerPainter(
                progress: timerState.progress,
                trackColor: palette?.timerTrack ?? theme.colorScheme.onSurface.withValues(alpha: 0.1),
                progressColor: palette?.timerProgress ?? theme.colorScheme.onSurface.withValues(alpha: 0.3),
                strokeWidth: 20.0,
              ),
            ),
          ),
          
          // Ortadaki Metin
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$minutes:$seconds',
                style: TextStyle(
                  fontSize: 84,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0,
                  color: palette != null ? Colors.white : theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              if (timerState.activeTask != null)
                Text(
                  timerState.activeTask!.title,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: palette != null ? Colors.white70 : theme.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              else
                Text(
                  timerState.mode.displayName,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: palette != null ? Colors.white70 : theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
