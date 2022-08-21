import 'dart:convert';
import 'dart:developer';

import 'package:stool_in/core/cache/get_cached_data.dart';
import 'package:stool_in/core/cache/keys/cache_datasource_keys.dart';
import 'package:stool_in/core/helpers/shared_preferences/shared_preferences_helper.dart';
import 'package:stool_in/features/info/data/model/info_model.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';

class DoubtsCachedDatasource
    with SharedPreferencesHelper
    implements GetCachedData<List<InfoEntity>> {
  @override
  Future<List<InfoEntity>> getCachedData() async {
    final data = await getString(key: CacheDatasourceKeys.doubtsCacheKey);
    final dataDecoded = jsonDecode(data!) as List;
    final result = dataDecoded.map((e) => InfoModel.fromMap(e)).toList();
    log('final cached data $result', name: 'cache');
    return result;
  }
}
