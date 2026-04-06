import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../history/models/session_record.dart';
import '../../../core/providers/repository_providers.dart';

part 'statistics_provider.g.dart';

/// Bu haftanın verilerini listeler. Map<int, int> döner: Key: Haftanın günü (1=Pzt, 7=Paz), Value: Dakika
@riverpod
class WeeklyStatistics extends _$WeeklyStatistics {
  @override
  Future<Map<int, int>> build() async {
    final repository = ref.watch(sessionRepositoryProvider);
    final now = DateTime.now();
    // Bulunduğumuz haftanın ilk günü (Pazartesi)
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
    // Pazardan sonraki gün (Haftanın sonu + 1)
    final end = start.add(const Duration(days: 7));

    final sessions = await repository.getSessionsForDateRange(start, end);

    // Günlere göre dağılım: 1..7 -> dakikalar
    final Map<int, int> weeklyData = {for (var i = 1; i <= 7; i++) i: 0};

    for (final session in sessions) {
      if (!session.wasInterrupted && session.sessionType == 'pomodoro') {
        final weekday = session.startTime.weekday;
        final minutes = session.durationSeconds ~/ 60;
        weeklyData[weekday] = (weeklyData[weekday] ?? 0) + minutes;
      }
    }

    return weeklyData;
  }
}

/// Sık odaklanılan kategoriler. Map<String, int> döner: Key: Kategori Adı, Value: Pomodoro Sayısı
@riverpod
class CategoryStatistics extends _$CategoryStatistics {
  @override
  Future<Map<String, int>> build() async {
    final repository = ref.watch(sessionRepositoryProvider);
    final now = DateTime.now();
    // Son 30 günü baz alalım
    final start = now.subtract(const Duration(days: 30));
    final end = now.add(const Duration(days: 1)); // bugün dahil

    final sessions = await repository.getSessionsForDateRange(start, end);

    final Map<String, int> categoryCounts = {};

    for (final session in sessions) {
      if (!session.wasInterrupted && session.sessionType == 'pomodoro') {
        final catName = session.task.value?.category.value?.name ?? 'Diğer';
        categoryCounts[catName] = (categoryCounts[catName] ?? 0) + 1;
      }
    }

    return categoryCounts;
  }
}
