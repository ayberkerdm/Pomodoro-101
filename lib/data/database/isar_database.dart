import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/tasks/models/task.dart';
import '../../features/history/models/session_record.dart';
import '../../features/tasks/models/task_category.dart';

class IsarDatabase {
  IsarDatabase._();

  static Isar? _instance;

  static Isar get instance {
    if (_instance == null) {
      throw StateError('IsarDatabase not initialized. Call initialize() first.');
    }
    return _instance!;
  }

  static bool get isInitialized => _instance != null;

  static Future<void> initialize() async {
    if (_instance != null) return;

    final dir = await getApplicationDocumentsDirectory();

    _instance = await Isar.open(
      [
        TaskSchema,
        SessionRecordSchema,
        TaskCategorySchema,
      ],
      directory: dir.path,
      name: 'focusflow_db',
    );
  }

  static Future<void> close() async {
    await _instance?.close();
    _instance = null;
  }

  /// Clears all data — use only for testing/reset
  static Future<void> clearAll() async {
    await _instance?.writeTxn(() async {
      await _instance!.clear();
    });
  }
}
