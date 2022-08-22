import 'dart:developer';

import 'package:stool_in/core/cache/helpers/decoded_list_cache_helper.dart';
import 'package:stool_in/core/cache/get_cached_data.dart';
import 'package:stool_in/core/cache/keys/cache_datasource_keys.dart';
import 'package:stool_in/features/info/data/model/info_model.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';

class DoubtsCachedDatasource implements GetCachedData<List<InfoEntity>> {
  final DecodedListCacheHelper _cacheDatasourceHelper;
  DoubtsCachedDatasource({
    required DecodedListCacheHelper cacheDatasourceHelper,
  }) : _cacheDatasourceHelper = cacheDatasourceHelper;
  @override
  Future<List<InfoEntity>> getCachedData() async {
    final decodedData = await _cacheDatasourceHelper.getDecodedList(
        key: CacheDatasourceKeys.doubtsCacheKey);
    final result = decodedData.map((e) => InfoModel.fromMap(e)).toList();
    log('final cached data $result', name: 'cache');
    return result;
  }
}
