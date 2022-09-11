import 'dart:developer';

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
    result.data?.map(
      (e) {
        var result = ServiceProviderModel.fromDataSource(e);

        final latitude =
            result.userData.map((e) => e.userLocationLatitude).first;
        log(latitude.toString());
        final longitude =
            result.userData.map((e) => e.userLocationLongitude).first;
        final distance = _distanceHelperCalculate.caculateDistanceToInt(
          currentUserLocation: Location(
            latitude: params.currentUserLocationLatitude,
            longitude: params.currentUserLocationLongitude,
          ),
          serviceProviderLocation: Location(
            latitude: latitude ?? 0,
            longitude: longitude ?? 0,
          ),
        );
        result = ServiceProviderModel.fromDataSource(e, distance: distance);
        distanceModel.add(result);
      },
    ).toList();
    // for (var serviceProviderModel in serviceProviderData!) {
    //   final distance = _distanceHelperCalculate.caculateDistanceToInt(
    //     currentUserLocation: Location(
    //       latitude: params.currentUserLocationLatitude,
    //       longitude: params.currentUserLocationLongitude,
    //     ),
    //     serviceProviderLocation: Location(
    //       latitude: serviceProviderModel.userData
    //               .map((e) => e.userLocationLatitude)
    //               .first ??
    //           0,
    //       longitude: serviceProviderModel.userData
    //               .map((e) => e.userLocationLongitude)
    //               .first ??
    //           0,
    //     ),
    //   );
    //   distanceModel.addAll(
    //     result.data?.map((e) =>
    //             ServiceProviderModel.fromDataSource(e, distance: distance)) ??
    //         [],
    //   );
    // }
    return distanceModel;
  }
}
