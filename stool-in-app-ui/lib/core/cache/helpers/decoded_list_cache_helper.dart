import 'dart:convert';

import '../../helpers/export/helpers_export.dart';



class DecodedListCacheHelper extends ReadLocalSecureStorageMethodImpl
    with SharedPreferencesHelper {
  Future<List<dynamic>> getDecodedList({
    required String key,
  }) async {
    final data = await getString(key: key);
    final dataDecoded = jsonDecode(data!) as List;

    return dataDecoded;
  }
}
