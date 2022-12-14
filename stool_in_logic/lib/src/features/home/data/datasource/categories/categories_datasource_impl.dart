import 'dart:developer';

import 'package:stool_in_core/stool_in_core.dart';

import '../../../domain/entity/categories/categories_entity.dart';
import '../../../domain/error/categories/categories_error.dart';
import '../../model/categories/categories_model.dart';
import 'categories_datasource.dart';



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
      final unlockCachedData =
          await _cacheUserActionsHelper.getUserGetCategoriesData();
      if (unlockCachedData == false) {
        final result =
            await _restClientGet.get(path: EndpointConstants.getCategories);
        final data = result.data
            .map<CategoriesEntity>(
              (model) => CategoriesModel.fromMap(model),
            )
            .toList();
        await saveJsonInCache(
          data: CacheDatasourceKeys.categoriesCacheKey,
          key: result.data.toString(),
        );
        await _cacheUserActionsHelper.setUserGetCategoriesData(value: true);
        return data ?? <CategoriesEntity>[];
      } else {
        final decodedCacheList = await _decodedListCacheHelper.getDecodedList(
            key: CacheDatasourceKeys.categoriesCacheKey);
        final entityCached =
            decodedCacheList.map((e) => CategoriesModel.fromMap(e)).toList();

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
