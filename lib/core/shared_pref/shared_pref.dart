import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPref {

  static const secureStorage = FlutterSecureStorage();
  static String onBoardkey = 'hasSeenOnboarding';

  static Future<void> saveOnboardingStatus(bool hasSeenOnboarding) async {
    await secureStorage.write(
         key: onBoardkey, value: hasSeenOnboarding ? 'true' : 'false');
  }

  static Future<bool> getOnboardingStatus() async {
    final onboardingStatusStr = await secureStorage.read(key: onBoardkey);
    if (onboardingStatusStr == null) {
      return false; // User hasn't seen onboarding yet
    }
    else {
      return onboardingStatusStr == 'true';
    }
  }

}