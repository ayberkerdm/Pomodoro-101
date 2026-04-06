import 'package:wakelock_plus/wakelock_plus.dart';

class WakelockService {
  WakelockService._();
  
  static final WakelockService instance = WakelockService._();

  /// Ekranın uyumasını engeller (özellikle pomodoro çalışırken)
  Future<void> enable() async {
    await WakelockPlus.enable();
  }

  /// Ekranın tekrar sistem ayarlarına göre uyumasına izin verir
  Future<void> disable() async {
    await WakelockPlus.disable();
  }
}
