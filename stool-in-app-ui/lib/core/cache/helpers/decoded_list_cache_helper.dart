import 'dart:convert';
import '../../../exports/app_exports.dart';



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
