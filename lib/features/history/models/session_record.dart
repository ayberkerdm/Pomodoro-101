import 'package:isar/isar.dart';
import '../../tasks/models/task.dart';

part 'session_record.g.dart';

@collection
class SessionRecord {
  Id id = Isar.autoIncrement;

  /// Ne zaman başladı
  DateTime startTime = DateTime.now();

  /// Ne zaman bitti
  DateTime? endTime;

  /// Oturumun türü (pomodoro, shortBreak, longBreak) enum string
  late String sessionType;

  /// Seçili hedeflenen dakika
  late int durationMinutes;

  /// Toplam odaklanılan (ya da geçirilen) süre saniye cinsinden
  late int durationSeconds;

  /// İlgili görev (varsa)
  final task = IsarLink<Task>();

  /// Yarıda kesildi mi?
  bool wasInterrupted = false;

  /// Verimlilik veya not (isteğe bağlı)
  String? notes;
}
