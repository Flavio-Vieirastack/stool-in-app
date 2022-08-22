import 'dart:developer';

import 'package:stool_in/core/cache/get_cached_datasource.dart';
import 'package:stool_in/core/cache/keys/cache_datasource_keys.dart';
import 'package:stool_in/features/home/data/model/categories/categories_model.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';

import '../../../../../../core/cache/helpers/decoded_list_cache_helper.dart';

class CategoriesCachedDatasource
    implements GetCachedDatasource<List<CategoriesEntity>> {
  final DecodedListCacheHelper _decodedListCacheHelper;
  CategoriesCachedDatasource({
    required DecodedListCacheHelper cacheDatasourceHelper,
  }) : _decodedListCacheHelper = cacheDatasourceHelper;
  @override
  Future<List<CategoriesEntity>> getCachedData() async {
    final decodedData = await _decodedListCacheHelper.getDecodedList(
        key: CacheDatasourceKeys.categoriesCacheKey);
    final result = decodedData.map((e) => CategoriesModel.fromMap(e)).toList();
    log('final cached data $result', name: 'cache');
    return result;
  }
}
