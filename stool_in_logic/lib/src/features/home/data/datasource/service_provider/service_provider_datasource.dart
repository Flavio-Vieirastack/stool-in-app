
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
  List<ServiceProviderModel>? calculateDistance({
    required RestClientResponse<List<dynamic>> result,
    required GetServiceProvidersParams params,
  }) {
    final distanceModel = <ServiceProviderModel>[];
    final serviceProviderData = result.data
        ?.map(
          (e) => ServiceProviderModel.fromDataSource(e),
        )
        .toList();
    for (var serviceProviderModel in serviceProviderData!) {
      for (var serviceProviderData in serviceProviderModel.userData) {
        final distance = _distanceHelperCalculate.caculateDistanceToInt(
          currentUserLocation: Location(
            latitude: params.currentUserLocationLatitude,
            longitude: params.currentUserLocationLongitude,
          ),
          serviceProviderLocation: Location(
            latitude: serviceProviderData.userLocationLatitude ?? 0.0,
            longitude: serviceProviderData.userLocationLongitude ?? 0.0,
          ),
        );
        distanceModel.addAll(result.data?.map((e) => ServiceProviderModel.fromDataSource(e, distance: distance)) ?? []);
      }
    }
    return distanceModel;
  }
}
