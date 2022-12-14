import 'dart:developer';

import 'package:stool_in_core/stool_in_core.dart';

import '../../../domain/entity/service_types/create_service_types_entity.dart';
import '../../../domain/entity/service_types/service_types_return_entity.dart';
import '../../../domain/error/get_user_service_types_error.dart';
import '../../model/service_type/service_type_return_model.dart';
import 'get_user_service_types_datasource.dart';


class GetUserServiceTypesDatasourceImpl extends SaveJsonInCacheDatasource
    implements GetUserServiceTypesDatasource {
  final RestClientGet _restClientGet;
  final CacheUserActionsHelper _cacheUserActionsHelper;
  final DecodedListCacheHelper _decodedListCacheHelper;
  GetUserServiceTypesDatasourceImpl({
    required RestClientGet restClientGet,
    required CacheUserActionsHelper cacheUserActionsHelper,
    required DecodedListCacheHelper decodedListCacheHelper,
  })  : _restClientGet = restClientGet,
        _decodedListCacheHelper = decodedListCacheHelper,
        _cacheUserActionsHelper = cacheUserActionsHelper;
  @override
  Future<List<ServiceTypesReturnEntity>> getUserServicesTypes({
    required CreateServiceTypesEntity serviceProviderId,
  }) async {
    try {
      final unlockCachedData =
          await _cacheUserActionsHelper.getUserGetUserServiceTypesData();
      if (unlockCachedData == false) {
        final result = await _restClientGet.get(
          path:
              '${EndpointConstants.getUserServiceTypes}/${serviceProviderId.serviceProviderId}',
        );
        final data =
            result.data.map<ServiceTypesReturnEntity>((e) => ServiceTypeReturnModel.fromMap(e)).toList();
        await saveJsonInCache(
          data: result.data.toString(),
          key: CacheDatasourceKeys.userServiceTypeCryptCacheKey,
        );
        await _cacheUserActionsHelper.setUserGetUserServiceTypesData(
          value: true,
        );
        return data;
      } else {
        final decodedCacheList = await _decodedListCacheHelper.getDecodedList(
          key: CacheDatasourceKeys.userServiceTypeCryptCacheKey,
        );
        final entityCached = decodedCacheList
            .map((e) => ServiceTypeReturnModel.fromMap(e))
            .toList();

        return entityCached;
      }
    } on RestClientException catch (e, s) {
      log(
        'Erro ao pegar service types no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw GetUserServiceTypesError(
          message: 'Erro ao pegar seus dados, tente mais tarde');
    } on GetUserServiceTypesError catch (e, s) {
      log(
        'Erro ao pegar service types no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw GetUserServiceTypesError(
          message: 'Erro ao pegar seus dados, tente mais tarde');
    } catch (e, s) {
      log(
        'Erro desconhecido ao pegar service types no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw GetUserServiceTypesError(
          message: 'Erro no servidor ao pegar seus dados, tente mais tarde');
    }
  }
}
