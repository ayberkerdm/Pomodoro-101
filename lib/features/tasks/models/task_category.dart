import 'package:isar/isar.dart';

part 'task_category.g.dart';

@collection
class TaskCategory {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String name;

  late String colorHex;

  late String iconName;

  short displayOrder = 0;

  bool isDefault = false;
}
