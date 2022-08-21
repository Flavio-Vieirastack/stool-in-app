import 'dart:developer';

import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

class CacheUserActionsHelper with SharedPreferencesHelper {
  final String userPassBySplashKey = 'user-pass-by-splash';
  final String userGetDoubtsDataKey = 'user-get-doubts-data';
  Future<void> setUserPassBySplash() async {
    await saveBool(key: userPassBySplashKey, value: true);
  }

  Future<void> setUserGetDoubtsData({required bool value}) async {
    await saveBool(key: userGetDoubtsDataKey, value: value);
  }

  Future<bool> getUserGetDoubtsData() async {
    final result = await getBool(
      key: userGetDoubtsDataKey,
    );
    return result ?? false;
  }

  Future<bool> getUserPassBySplash() async {
    final result = await getBool(
      key: userPassBySplashKey,
    );
    return result ?? false;
  }
}
