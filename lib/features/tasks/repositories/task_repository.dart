import 'package:isar/isar.dart';
import '../models/task.dart';
import '../models/task_category.dart';

class TaskRepository {
  final Isar _isar;

  TaskRepository(this._isar);

  // --- Tasks ---

  Stream<List<Task>> watchAllTasks() {
    return _isar.collection<Task>().where().watch(fireImmediately: true);
  }

  Stream<List<Task>> watchPendingTasks() {
    return _isar.collection<Task>().filter().isCompletedEqualTo(false).watch(fireImmediately: true);
  }

  Future<List<Task>> getTasks() async {
    return await _isar.collection<Task>().where().findAll();
  }

  Future<Task?> getTaskById(int id) async {
    return await _isar.collection<Task>().get(id);
  }

  Future<void> saveTask(Task task) async {
    await _isar.writeTxn(() async {
      await _isar.collection<Task>().put(task);
      // Link needs to be saved manually
      await task.category.save();
    });
  }

  Future<void> deleteTask(int id) async {
    await _isar.writeTxn(() async {
      await _isar.collection<Task>().delete(id);
    });
  }

  // --- Categories ---

  Future<List<TaskCategory>> getCategories() async {
    return await _isar.collection<TaskCategory>().where().sortByDisplayOrder().findAll();
  }

  Future<TaskCategory?> getCategoryById(int id) async {
    return await _isar.collection<TaskCategory>().get(id);
  }

  Future<void> saveCategory(TaskCategory category) async {
    await _isar.writeTxn(() async {
      await _isar.collection<TaskCategory>().put(category);
    });
  }

  Future<void> deleteCategory(int id) async {
    await _isar.writeTxn(() async {
      await _isar.collection<TaskCategory>().delete(id);
    });
  }

  /// Initialize default categories if none exist
  Future<void> initializeDefaultCategories() async {
    final count = await _isar.collection<TaskCategory>().count();
    if (count == 0) {
      await _isar.writeTxn(() async {
        await _isar.collection<TaskCategory>().putAll([
          TaskCategory()
            ..name = 'Work'
            ..colorHex = '#4A90E2'
            ..iconName = 'work'
            ..displayOrder = 0
            ..isDefault = true,
          TaskCategory()
            ..name = 'Study'
            ..colorHex = '#F5A623'
            ..iconName = 'book'
            ..displayOrder = 1
            ..isDefault = true,
          TaskCategory()
            ..name = 'Personal'
            ..colorHex = '#7ED321'
            ..iconName = 'person'
            ..displayOrder = 2
            ..isDefault = true,
        ]);
      });
    }
  }
}
