import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/session_record.dart';
import '../../../core/providers/repository_providers.dart';

part 'history_provider.g.dart';

@riverpod
class SessionHistory extends _$SessionHistory {
  @override
  Stream<List<SessionRecord>> build() {
    final repository = ref.watch(sessionRepositoryProvider);
    // En yeniler en üstte olacak şekilde dinler
    return repository.watchRecentSessions();
  }

  Future<void> clearHistory() async {
    // İleride eklenebilecek "tüm geçmişi temizle" mantığı (Opsiyonel)
  }
}
