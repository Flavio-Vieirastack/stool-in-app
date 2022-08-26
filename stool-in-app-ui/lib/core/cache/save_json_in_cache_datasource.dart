import 'dart:convert';
import 'dart:developer';

import 'package:stool_in/core/helpers/secure_storage_helper/secure_storage_methos.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

abstract class SaveJsonInCacheDatasource
    extends WriteLocalSecureStorageMethodsImpl with SharedPreferencesHelper {
  Future<void> saveJsonInCache({
    required dynamic data,
    required String key,
  }) async {
    log('Saved no crypt data $data', name: 'Cache');
    await saveString(
      key: key,
      value: jsonEncode(data),
    );
  }
}
