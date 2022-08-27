

import '../../../helpers/export/helpers_export.dart';

class CacheUserActionsHelper with SharedPreferencesHelper {
  final String _userGetDoubtsDataKey = 'user-get-doubts-data';
  final String _userGetRulesDataKey = 'user-get-rules-data';
  final String _userGetCategoriesDataKey = 'user-get-categories-data';
  final String _userGetUserServiceTypesData =
      'user-get-user-service-types-data';

  Future<void> setUserGetDoubtsData({required bool value}) async {
    await saveBool(key: _userGetDoubtsDataKey, value: value);
  }

  Future<void> setUserGetRulesData({required bool value}) async {
    await saveBool(key: _userGetRulesDataKey, value: value);
  }

  Future<void> setUserGetCategoriesData({required bool value}) async {
    await saveBool(key: _userGetCategoriesDataKey, value: value);
  }

  Future<void> setUserGetUserServiceTypesData({required bool value}) async {
    await saveBool(key: _userGetUserServiceTypesData, value: value);
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

  Future<bool> getUserGetUserServiceTypesData() async {
    final result = await getBool(
      key: _userGetUserServiceTypesData,
    );
    return result ?? false;
  }
}
