import 'package:flutter/material.dart';
import '../../history/models/session_record.dart';
import 'package:intl/intl.dart';

class HistoryListItem extends StatelessWidget {
  final SessionRecord session;

  const HistoryListItem({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final taskTitle = session.task.value?.title ?? 'Serbest Oturum';
    final durationMin = session.durationSeconds ~/ 60;
    final timeStr = DateFormat('HH:mm').format(session.startTime);
    final dateStr = DateFormat('d MMM', 'tr_TR').format(session.startTime);

    final isPomodoro = session.sessionType == 'pomodoro';

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          // Mod ikonu
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isPomodoro
                  ? theme.colorScheme.primary.withValues(alpha: 0.15)
                  : theme.colorScheme.tertiary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPomodoro ? Icons.timer_rounded : Icons.coffee_rounded,
              size: 20,
              color: isPomodoro
                  ? theme.colorScheme.primary
                  : theme.colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 14),
          // Bilgi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  isPomodoro ? 'Pomodoro' : 'Mola',
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Süre & Saat
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$durationMin dk',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$dateStr, $timeStr',
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
