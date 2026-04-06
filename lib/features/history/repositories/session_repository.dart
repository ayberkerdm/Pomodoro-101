import 'package:isar/isar.dart';
import '../models/session_record.dart';

class SessionRepository {
  final Isar _isar;

  SessionRepository(this._isar);

  Stream<List<SessionRecord>> watchRecentSessions({int limit = 50}) {
    return _isar.collection<SessionRecord>()
        .where()
        .sortByStartTimeDesc()
        .limit(limit)
        .watch(fireImmediately: true);
  }

  Future<List<SessionRecord>> getSessionsForDateRange(DateTime start, DateTime end) async {
    return await _isar.collection<SessionRecord>()
        .filter()
        .startTimeGreaterThan(start)
        .and()
        .startTimeLessThan(end)
        .sortByStartTimeDesc()
        .findAll();
  }

  Future<void> saveSession(SessionRecord session) async {
    await _isar.writeTxn(() async {
      await _isar.collection<SessionRecord>().put(session);
      await session.task.save();
    });
  }

  Future<void> deleteSession(int id) async {
    await _isar.writeTxn(() async {
      await _isar.collection<SessionRecord>().delete(id);
    });
  }
}
