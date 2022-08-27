import 'dart:convert';
import 'dart:developer';

import '../../exports/app_exports.dart';





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
