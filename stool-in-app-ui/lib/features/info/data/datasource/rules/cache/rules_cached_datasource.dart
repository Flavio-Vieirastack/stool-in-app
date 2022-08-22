import 'dart:developer';

import 'package:stool_in/core/cache/get_cached_datasource.dart';
import 'package:stool_in/core/cache/helpers/decoded_list_cache_helper.dart';
import 'package:stool_in/features/info/data/model/info_model.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';

import '../../../../../../core/cache/keys/cache_datasource_keys.dart';

class RulesCachedDatasource implements GetCachedDatasource<List<InfoEntity>> {
  final DecodedListCacheHelper _decodedListCacheHelper;
  RulesCachedDatasource({
    required DecodedListCacheHelper decodedListCacheHelper,
  }) : _decodedListCacheHelper = decodedListCacheHelper;
  @override
  Future<List<InfoEntity>> getCachedData() async {
    final decodedData = await _decodedListCacheHelper.getDecodedList(
        key: CacheDatasourceKeys.rulesCacheKey);
    final result = decodedData.map((e) => InfoModel.fromMap(e)).toList();
    log('final cached data $result', name: 'cache');
    return result;
  }
}
