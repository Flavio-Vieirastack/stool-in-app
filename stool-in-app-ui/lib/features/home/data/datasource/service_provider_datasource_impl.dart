import 'dart:developer';

import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/helpers/distance_helper/distance_helper_calculate.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/features/home/data/datasource/service_provider_datasource.dart';
import 'package:stool_in/features/home/data/model/service_provider_model.dart';
import 'package:stool_in/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/error/service_provider_error.dart';

import '../../../../core/rest_client/rest_client_response.dart';
import '../../domain/entity/get_service_providers_params.dart';

class ServiceProviderDatasourceImpl implements ServiceProviderDatasource {
  final RestClientGet _restClientGet;
  final DistanceHelperCalculate _distanceHelperCalculate;
  ServiceProviderDatasourceImpl({
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
        ?.map((e) => e.userData.userLocationLatitude)
        .toList()
        .first;
    final serviceProviderLongitude = serviceProviderData
        ?.map((e) => e.userData.userLocationLongitude)
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
