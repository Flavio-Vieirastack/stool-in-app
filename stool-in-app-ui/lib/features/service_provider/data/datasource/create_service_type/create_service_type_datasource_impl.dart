import 'dart:developer';

import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/service_provider/data/datasource/create_service_type/create_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/service_type_return_model.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_type_error.dart';

class CreateServiceTypeDatasourceImpl implements CreateServiceTypeDatasource {
  final RestClientPost _restClientPost;
  CreateServiceTypeDatasourceImpl({
    required RestClientPost restClientPost,
  }) : _restClientPost = restClientPost;
  @override
  Future<ServiceTypesReturnEntity> call({
    required CreateServiceTypeModel createServiceTypeModel,
  }) async {
    try {
      final resut = await _restClientPost.post(
        path:
            '${EndpointConstants.createServiceType}/${createServiceTypeModel.serviceProviderId}',
        data: createServiceTypeModel.toMap(),
      );
      final data = ServiceTypeReturnModel.fromMap(resut.data);
      return data;
    } on RestClientException catch (e, s) {
      log('Erro ao criar service type no datasource impl',
          error: e, stackTrace: s);
      throw CreateServiceTypeError(message: 'Erro ao criar serviço, tente mais tarde');
    } catch(e,s) {
      log('Erro ao criar service type no datasource impl',
          error: e, stackTrace: s);
      throw CreateServiceTypeError(message: 'Erro no servidor ao criar serviço, tente mais tarde');
    }
  }
}
