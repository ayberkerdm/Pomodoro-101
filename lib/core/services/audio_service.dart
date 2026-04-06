import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

class AudioService {
  AudioService._();
  
  static final AudioService instance = AudioService._();
  static final AudioPlayer _player = AudioPlayer();
  
  /// Ses dosyasını hazırlayıp çalar.
  Future<void> playRingSound() async {
    try {
      // "assets/sounds/bell.mp3" tarzı bir müzik olduğunu varsayalım.
      // Eklendiğinde çalışacaktır. Şimdilik Asset ekli olmadığı için, try/catch içinde log atıyoruz:
      await _player.setAsset('assets/sounds/bell.mp3');
      await _player.play();
    } catch (e) {
      if (kDebugMode) {
        print('Ses dosyası bulunamadı veya çalınamadı: $e');
        print('assets/sounds/bell.mp3 eksik olabilir.');
      }
    }
  }

  Future<void> playTickSound() async {
    try {
      await _player.setAsset('assets/sounds/tick.mp3');
      await _player.play();
    } catch (e) {
      // Sessiz hata - Tick dosyası eksik diye her saniye konsolu doldurma
    }
  }
}
