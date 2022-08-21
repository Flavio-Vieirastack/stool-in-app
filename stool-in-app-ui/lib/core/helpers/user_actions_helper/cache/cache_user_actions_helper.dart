import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

class CacheUserActionsHelper with SharedPreferencesHelper {
  final String userPassBySplashKey = 'user-pass-by-splash';
  final String userGetDoubtsDataKey = 'user-get-doubts-data';
  Future<void> setUserPassBySplash() async {
    await saveBool(key: userPassBySplashKey, value: true);
  }
  Future<void> setUserGetDoubtsData() async {
    await saveBool(key: userGetDoubtsDataKey, value: true);
  }
  Future<void> getUserGetDoubtsData() async {
    await getBool(key: userGetDoubtsDataKey,);
  }

  Future<bool> getUserPassBySplash() async {
    final result = await getBool(
      key: userPassBySplashKey,
    );
    return result ?? false;
  }
}
