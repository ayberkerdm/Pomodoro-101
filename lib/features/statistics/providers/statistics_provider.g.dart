// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weeklyStatisticsHash() => r'3c1449b8f4dcabe6c1c0c29c781a394129eff3b2';

/// Bu haftanın verilerini listeler. Map<int, int> döner: Key: Haftanın günü (1=Pzt, 7=Paz), Value: Dakika
///
/// Copied from [WeeklyStatistics].
@ProviderFor(WeeklyStatistics)
final weeklyStatisticsProvider =
    AutoDisposeAsyncNotifierProvider<WeeklyStatistics, Map<int, int>>.internal(
  WeeklyStatistics.new,
  name: r'weeklyStatisticsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weeklyStatisticsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WeeklyStatistics = AutoDisposeAsyncNotifier<Map<int, int>>;
String _$categoryStatisticsHash() =>
    r'54fc35a25626b3be9f6077f66aed8c8c471c3b4e';

/// Sık odaklanılan kategoriler. Map<String, int> döner: Key: Kategori Adı, Value: Pomodoro Sayısı
///
/// Copied from [CategoryStatistics].
@ProviderFor(CategoryStatistics)
final categoryStatisticsProvider = AutoDisposeAsyncNotifierProvider<
    CategoryStatistics, Map<String, int>>.internal(
  CategoryStatistics.new,
  name: r'categoryStatisticsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryStatisticsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryStatistics = AutoDisposeAsyncNotifier<Map<String, int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
