import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/task.dart';
import '../models/task_category.dart';
import '../../../core/providers/repository_providers.dart';

part 'task_provider.g.dart';

@riverpod
class TaskList extends _$TaskList {
  @override
  Stream<List<Task>> build() {
    final repository = ref.watch(taskRepositoryProvider);
    return repository.watchAllTasks();
  }

  Future<void> addTask(Task task) async {
    final repository = ref.read(taskRepositoryProvider);
    await repository.saveTask(task);
  }

  Future<void> toggleTaskCompletion(int id) async {
    final repository = ref.read(taskRepositoryProvider);
    final task = await repository.getTaskById(id);
    if (task != null) {
      task.isCompleted = !task.isCompleted;
      await repository.saveTask(task);
    }
  }

  Future<void> deleteTask(int id) async {
    final repository = ref.read(taskRepositoryProvider);
    await repository.deleteTask(id);
  }
}

@riverpod
class TaskCategoryList extends _$TaskCategoryList {
  @override
  Future<List<TaskCategory>> build() async {
    final repository = ref.watch(taskRepositoryProvider);
    return repository.getCategories();
  }
}
