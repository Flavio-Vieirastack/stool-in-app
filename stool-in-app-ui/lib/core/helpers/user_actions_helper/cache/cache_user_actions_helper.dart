import 'dart:developer';

import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

class CacheUserActionsHelper with SharedPreferencesHelper {
  final String _userGetDoubtsDataKey = 'user-get-doubts-data';


  Future<void> setUserGetDoubtsData({required bool value}) async {
    await saveBool(key: _userGetDoubtsDataKey, value: value);
  }

  Future<bool> getUserGetDoubtsData() async {
    final result = await getBool(
      key: _userGetDoubtsDataKey,
    );
    return result ?? false;
  }
}
