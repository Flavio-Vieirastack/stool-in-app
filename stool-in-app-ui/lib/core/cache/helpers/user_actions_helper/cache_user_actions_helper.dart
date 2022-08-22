import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

class CacheUserActionsHelper with SharedPreferencesHelper {
  final String _userGetDoubtsDataKey = 'user-get-doubts-data';
  final String _userGetRulesDataKey = 'user-get-rules-data';
  final String _userGetCategoriesDataKey = 'user-get-categories-data';

  Future<void> setUserGetDoubtsData({required bool value}) async {
    await saveBool(key: _userGetDoubtsDataKey, value: value);
  }
  Future<void> setUserGetRulesData({required bool value}) async {
    await saveBool(key: _userGetRulesDataKey, value: value);
  }
  Future<void> setUserGetCategoriesData({required bool value}) async {
    await saveBool(key: _userGetCategoriesDataKey, value: value);
  }

  Future<bool> getUserGetDoubtsData() async {
    final result = await getBool(
      key: _userGetDoubtsDataKey,
    );
    return result ?? false;
  }
  Future<bool> getUserGetRulesData() async {
    final result = await getBool(
      key: _userGetRulesDataKey,
    );
    return result ?? false;
  }
  Future<bool> getUserGetCategoriesData() async {
    final result = await getBool(
      key: _userGetCategoriesDataKey,
    );
    return result ?? false;
  }
}
