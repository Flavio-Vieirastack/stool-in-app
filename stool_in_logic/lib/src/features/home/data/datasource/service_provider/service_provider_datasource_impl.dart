import 'dart:developer';

import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/src/features/home/data/datasource/service_provider/service_provider_datasource.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/service_provider_entity.dart';

import '../../../domain/entity/service_provider/get_service_providers_params.dart';
import '../../../domain/error/service_provider/service_provider_error.dart';

class GetServiceProviderDatasourceImpl implements GetServiceProviderDatasource {
  final RestClientGet _restClientGet;
  final ServiceProviderDatasourceCalculateDistance
      _serviceProviderDatasourceCalculateDistance;
  GetServiceProviderDatasourceImpl({
    required RestClientGet restClientGet,
    required ServiceProviderDatasourceCalculateDistance
        serviceProviderDatasourceCalculateDistance,
  })  : _restClientGet = restClientGet,
        _serviceProviderDatasourceCalculateDistance =
            serviceProviderDatasourceCalculateDistance;

  @override
  Future<List<ServiceProviderEntity>> call({
    required GetServiceProvidersParams providersParams,
  }) async {
    try {
      final result = await _restClientGet.get<List>(
        path: EndpointConstants.getServiceProvider,
        queryParams: {
          'pages': providersParams.pageQuantity,
        },
      );
      final model =
          _serviceProviderDatasourceCalculateDistance.calculateDistance(
        result: result,
        params: providersParams,
      );

      return model ?? <ServiceProviderEntity>[];
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
