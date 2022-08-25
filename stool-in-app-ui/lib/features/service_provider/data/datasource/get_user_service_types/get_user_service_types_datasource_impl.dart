import 'dart:developer';

import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/service_provider/data/datasource/get_user_service_types/get_user_service_types_datasource.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/service_type_return_model.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/get_user_service_types_error.dart';

class GetUserServiceTypesDatasourceImpl
    implements GetUserServiceTypesDatasource {
  final RestClientGet _restClientGet;
  GetUserServiceTypesDatasourceImpl({
    required RestClientGet restClientGet,
  }) : _restClientGet = restClientGet;
  @override
  Future<List<ServiceTypesReturnEntity>> call({
    required CreateServiceTypesEntity serviceProviderId,
  }) async {
    try {
      final result = await _restClientGet.get(
        path:
            '${EndpointConstants.getUserServiceTypes}/${serviceProviderId.serviceProviderId}',
      ) as List;
      final data =
          result.map((e) => ServiceTypeReturnModel.fromMap(e)).toList();
      return data;
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
