
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/service_provider/service_provider_entity.dart';

import '../../../domain/entity/service_provider/get_service_providers_params.dart';
import '../../model/service_provider/service_provider_model.dart';

abstract class GetServiceProviderDatasource {
  Future<List<ServiceProviderEntity>> call({
    required GetServiceProvidersParams providersParams,
  });
}

class ServiceProviderDatasourceCalculateDistance {
  final DistanceHelperCalculate _distanceHelperCalculate;
  ServiceProviderDatasourceCalculateDistance({
    required DistanceHelperCalculate distanceHelperCalculate,
  }) : _distanceHelperCalculate = distanceHelperCalculate;
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
