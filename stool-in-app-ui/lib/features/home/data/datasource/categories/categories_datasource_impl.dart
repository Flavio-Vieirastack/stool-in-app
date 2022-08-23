import 'dart:developer';

import 'package:stool_in/core/cache/keys/cache_datasource_keys.dart';
import 'package:stool_in/core/cache/save_json_in_cache_datasource.dart';
import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource.dart';
import 'package:stool_in/features/home/data/model/categories/categories_model.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';

import '../../../../../core/cache/helpers/decoded_list_cache_helper.dart';
import '../../../../../core/cache/helpers/user_actions_helper/cache_user_actions_helper.dart';

class CategoriesDatasourceImpl extends SaveJsonInCacheDatasource
    implements CategoriesDatasource {
  final RestClientGet _restClientGet;
  final DecodedListCacheHelper _decodedListCacheHelper;
  final CacheUserActionsHelper _cacheUserActionsHelper;
  CategoriesDatasourceImpl({
    required RestClientGet restClientGet,
    required CacheUserActionsHelper cacheUserActionsHelper,
    required DecodedListCacheHelper decodedListCacheHelper,
  })  : _restClientGet = restClientGet,
        _cacheUserActionsHelper = cacheUserActionsHelper,
        _decodedListCacheHelper = decodedListCacheHelper;
  @override
  Future<List<CategoriesEntity>> call() async {
    try {
      final result =
          await _restClientGet.get(path: EndpointConstants.getCategories);
      final data = result.data
          .map<CategoriesModel>(
            (model) => CategoriesModel.fromMap(model),
          )
          .toList();
      await saveJsonInCache(
        data: CacheDatasourceKeys.categoriesCacheKey,
        key: result.data,
      );
      final decodedCacheList = await _decodedListCacheHelper.getDecodedList(
          key: CacheDatasourceKeys.categoriesCacheKey);
      final entityCached =
          decodedCacheList.map((e) => CategoriesModel.fromMap(e)).toList();
      final unlockCachedData =
          await _cacheUserActionsHelper.getUserGetCategoriesData();

      if (unlockCachedData == false) {
        return data ?? <CategoriesEntity>[];
      } else {
        return entityCached;
      }
    } on RestClientException catch (e, s) {
      log('Erro ao pegar categorias no datasource impl',
          error: e, stackTrace: s);
      throw CategoriesError(
        message: 'Erro ao buscar categorias, tente mais tarde',
      );
    } on CategoriesError catch (e, s) {
      log('Erro ao pegar categorias no datasource impl',
          error: e, stackTrace: s);
      throw CategoriesError(
        message: 'Erro no servidor ao buscar categorias, tente mais tarde',
      );
    }
  }
}
