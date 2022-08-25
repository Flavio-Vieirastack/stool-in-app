import 'dart:convert';

import 'package:stool_in/core/helpers/secure_storage_helper/secure_storage_methos.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

class DecodedListCacheHelper extends ReadLocalSecureStorageMethodImpl
    with SharedPreferencesHelper {
  Future<List<dynamic>> getDecodedList({
    required String key,
    bool isCryptedData = false,
  }) async {
    if (isCryptedData == false) {
      final data = await getString(key: key);
      final dataDecoded = jsonDecode(data!) as List;

      return dataDecoded;
    } else {
      final data = await read(key: key);
      final decodedData = jsonDecode(data!) as List;
      return decodedData;
    }
  }
}
