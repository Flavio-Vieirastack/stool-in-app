import 'dart:convert';
import 'dart:developer';

import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

abstract class SaveJsonInCacheDatasource with SharedPreferencesHelper {
  Future<void> saveJsonInCache({
    required dynamic data,
    required String key,
  }) async {
    log('Saved data $data', name: 'Cache');
    await saveString(
      key: key,
      value: jsonEncode(data),
    );
  }
}
