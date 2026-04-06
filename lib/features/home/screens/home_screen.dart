import 'package:flutter/material.dart';
import '../widgets/daily_summary_card.dart';
import '../widgets/quick_timer_card.dart';
import '../widgets/motivation_quote_card.dart';
import '../widgets/today_tasks_preview.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Günün saatine göre selamlama
    final now = DateTime.now();
    String greeting = "İyi Günler";
    if (now.hour < 12) {
      greeting = "Günaydın";
    } else if (now.hour > 18) {
      greeting = "İyi Akşamlar";
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Selamlama ve Ayarlar ikon başlığı
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '$greeting,\nOdaklanma Zamanı!',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(AppRoutes.settings);
                    },
                    icon: Icon(
                      Icons.settings_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 2. Günün Özeti (Dakika, Pomodoro Sayısı)
              const DailySummaryCard(),
              const SizedBox(height: 24),

              // 3. Tek tıklamayla Timer sekmesine fırlatan araç
              const QuickTimerCard(),
              const SizedBox(height: 24),

              // 4. Motive edici söz!
              const MotivationQuoteCard(),
              const SizedBox(height: 24),

              // 5. Küçük görev listesi
              const TodayTasksPreview(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
