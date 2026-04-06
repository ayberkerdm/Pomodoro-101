import 'package:isar/isar.dart';
import 'task_category.dart';

part 'task.g.dart';

@collection
class Task {
  Id id = Isar.autoIncrement;

  late String title;

  String? description;

  final category = IsarLink<TaskCategory>();

  /// Etiketler (örn. ["Acil", "Kişisel"])
  List<String> tags = [];

  bool isCompleted = false;

  /// Hedeflenen pomodoro seansı sayısı
  short targetPomodoros = 1;

  /// Tamamlanan pomodoro seansı sayısı
  short completedPomodoros = 0;

  DateTime createdAt = DateTime.now();

  DateTime? updatedAt;

  DateTime? completedAt;

  DateTime? dueDate;
}
