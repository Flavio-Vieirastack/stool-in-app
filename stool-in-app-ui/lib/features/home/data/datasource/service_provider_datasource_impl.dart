import 'dart:developer';

import 'package:stool_in_app_ui/core/constants/endpoint_constants.dart';
import 'package:stool_in_app_ui/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in_app_ui/features/home/data/datasource/service_provider_datasource.dart';
import 'package:stool_in_app_ui/features/home/data/model/service_provider_model.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/error/service_provider_error.dart';

class ServiceProviderDatasourceImpl implements ServiceProviderDatasource {
  final RestClientGet _restClientGet;
  ServiceProviderDatasourceImpl({
    required RestClientGet restClientGet,
  }) : _restClientGet = restClientGet;
  @override
  Future<List<ServiceProviderEntity>> call({required int pageQuantity}) async {
    try {
      final result = await _restClientGet.get<List>(
        path: EndpointConstants.getServiceProvider,
        queryParams: {
          'pages': pageQuantity,
        },
      );
      final serviceProviderData =
          result.data?.map((e) => ServiceProviderModel.fromMap(e)).toList();
      return serviceProviderData ?? <ServiceProviderEntity>[];
    } on ServiceProviderError catch (e, s) {
      log('Erro ao pegar dados do prestador de serviço no datasource impl',
          error: e, stackTrace: s);
      throw ServiceProviderError(
          message: 'Erro ao buscar dados, tente mais tarde');
    } catch (e, s) {
      log(
        'Erro desconhecido ao pegar dados do prestador de serviço no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw ServiceProviderError(
          message: 'Erro desconhecido ao pegar dados do usuário');
    }
  }
}
