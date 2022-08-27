import 'dart:convert';
import 'dart:developer';

import '../helpers/export/helpers_export.dart';



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
