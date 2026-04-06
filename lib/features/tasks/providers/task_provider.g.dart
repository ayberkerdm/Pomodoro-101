// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskListHash() => r'6ff2417a0950ca147e1ce6c1080128e2a9b39501';

/// See also [TaskList].
@ProviderFor(TaskList)
final taskListProvider =
    AutoDisposeStreamNotifierProvider<TaskList, List<Task>>.internal(
  TaskList.new,
  name: r'taskListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskList = AutoDisposeStreamNotifier<List<Task>>;
String _$taskCategoryListHash() => r'185d57d7d78e4fc242d8bb65f46f1b393de0d065';

/// See also [TaskCategoryList].
@ProviderFor(TaskCategoryList)
final taskCategoryListProvider = AutoDisposeAsyncNotifierProvider<
    TaskCategoryList, List<TaskCategory>>.internal(
  TaskCategoryList.new,
  name: r'taskCategoryListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskCategoryListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskCategoryList = AutoDisposeAsyncNotifier<List<TaskCategory>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
