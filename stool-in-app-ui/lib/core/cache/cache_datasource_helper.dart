import 'dart:convert';

import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';

class CacheDatasourceHelper with SharedPreferencesHelper {
  Future<List<dynamic>> getDecodedList({required String key}) async {
    final data = await getString(key: key);
    final dataDecoded = jsonDecode(data!) as List;

    return dataDecoded;
  }
}
