import 'dart:developer';
import '../../../../../exports/app_exports.dart';

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
      final distance =
          _serviceProviderDatasourceCalculateDistance.calculateDistance(
        result: result,
        params: providersParams,
      );
      final serviceProvider = result.data
          ?.map(
            (map) =>
                ServiceProviderModel.fromDataSource(map, distance: distance),
          )
          .toList();
      return serviceProvider ?? <ServiceProviderEntity>[];
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
