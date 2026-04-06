// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sessionHistoryHash() => r'b8202055074466f356533efdab747da193ad1310';

/// See also [SessionHistory].
@ProviderFor(SessionHistory)
final sessionHistoryProvider = AutoDisposeStreamNotifierProvider<SessionHistory,
    List<SessionRecord>>.internal(
  SessionHistory.new,
  name: r'sessionHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sessionHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SessionHistory = AutoDisposeStreamNotifier<List<SessionRecord>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
