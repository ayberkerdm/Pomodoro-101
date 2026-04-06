import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/database/isar_database.dart';
import '../../features/tasks/repositories/task_repository.dart';
import '../../features/history/repositories/session_repository.dart';
import '../../features/settings/repositories/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError('sharedPreferences provider is not initialized');
}

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  return TaskRepository(IsarDatabase.instance);
}

@riverpod
SessionRepository sessionRepository(SessionRepositoryRef ref) {
  return SessionRepository(IsarDatabase.instance);
}

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SettingsRepository(prefs);
}
