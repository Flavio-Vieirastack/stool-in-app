import 'dart:developer';

import '../../../../../core/constants/export/constants_export.dart';
import '../../../../../core/helpers/export/helpers_export.dart';
import '../../../../../core/rest_client/export/rest_client_export.dart';
import '../../../export/home_export.dart';




class GetServiceProviderDatasourceImpl implements GetServiceProviderDatasource {
  final RestClientGet _restClientGet;
  final DistanceHelperCalculate _distanceHelperCalculate;
  GetServiceProviderDatasourceImpl({
    required RestClientGet restClientGet,
    required DistanceHelperCalculate distanceHelperCalculate,
  })  : _restClientGet = restClientGet,
        _distanceHelperCalculate = distanceHelperCalculate;
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
      final distance = calculateDistance(
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

  @override
  int calculateDistance({
    required RestClientResponse<List<dynamic>> result,
    required GetServiceProvidersParams params,
  }) {
    final serviceProviderData = result.data
        ?.map(
          (e) => ServiceProviderModel.fromDataSource(e),
        )
        .toList();
    final serviceProviderLatitude = serviceProviderData
        ?.map(
            (e) => e.userData.map((e) => e.userLocationLatitude).toList().first)
        .toList()
        .first;
    final serviceProviderLongitude = serviceProviderData
        ?.map((e) =>
            e.userData.map((e) => e.userLocationLongitude).toList().first)
        .toList()
        .first;

    final distance = _distanceHelperCalculate.caculateDistanceToInt(
      currentUserLocation: Location(
        latitude: params.currentUserLocationLatitude,
        longitude: params.currentUserLocationLongitude,
      ),
      serviceProviderLocation: Location(
        latitude: serviceProviderLatitude ?? 0.0,
        longitude: serviceProviderLongitude ?? 0.0,
      ),
    );
    return distance;
  }
}
