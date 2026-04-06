import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/statistics_provider.dart';
import '../widgets/weekly_bar_chart.dart';
import '../widgets/category_pie_chart.dart';
import '../widgets/insight_card.dart';
import 'package:go_router/go_router.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weeklyAsync = ref.watch(weeklyStatisticsProvider);
    final categoryAsync = ref.watch(categoryStatisticsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'İstatistikler',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Geçmiş',
            icon: const Icon(Icons.history_rounded),
            onPressed: () => context.push('/history'),
          ),
        ],
      ),
      body: weeklyAsync.when(
        error: (e, _) => Center(child: Text('Hata: $e')),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (weeklyData) {
          // Toplam bu hafta
          final totalMinutes = weeklyData.values.fold(0, (a, b) => a + b);
          final totalPomodoros = weeklyData.values.fold(0, (a, b) => a + (b ~/ 25));

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
            children: [
              // — Özet Kartları —
              Row(
                children: [
                  Expanded(
                    child: InsightCard(
                      title: 'Bu Hafta',
                      value: '$totalMinutes dk',
                      icon: Icons.timer_rounded,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: InsightCard(
                      title: 'Pomodoro',
                      value: '$totalPomodoros 🍅',
                      icon: Icons.check_circle_rounded,
                      color: theme.colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // — Haftalık Bar Grafik —
              Text(
                'Haftalık Odaklanma',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: WeeklyBarChart(
                    weeklyData: weeklyData,
                    barColor: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // — Kategori Pasta Grafik —
              Text(
                'Kategori Dağılımı (Son 30 Gün)',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: categoryAsync.when(
                    loading: () => const SizedBox(
                      height: 150,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    error: (e, _) => Text('Hata: $e'),
                    data: (catData) => CategoryPieChart(categoryData: catData),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
