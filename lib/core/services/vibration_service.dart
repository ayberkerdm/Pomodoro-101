import 'package:vibration/vibration.dart';

class VibrationService {
  VibrationService._();

  static final VibrationService instance = VibrationService._();

  Future<void> vibrateHeavy() async {
    bool hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator) {
      await Vibration.vibrate(duration: 1000);
    }
  }

  Future<void> vibrateLight() async {
    bool hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator) {
      // Sadece ufak bir haptic feedback havası için
      await Vibration.vibrate(duration: 100);
    }
  }
}
