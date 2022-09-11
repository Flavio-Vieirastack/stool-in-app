import 'dart:developer';

import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../stool_in_core.dart';

class ServiceProviderDistanceListCalculate {
  final DistanceHelperCalculate _distanceHelperCalculate;
  ServiceProviderDistanceListCalculate({
    required DistanceHelperCalculate distanceHelperCalculate,
  }) : _distanceHelperCalculate = distanceHelperCalculate;
  List<int> calculateDistance({
    required List<ServiceProviderEntity> serviceProviders,
    required GetServiceProvidersParams params,
  }) {
    final distances = <int>[];
    int? distance;

    for (var element in serviceProviders) {
      final latitude =
          element.userData.map((e) => e.userLocationLatitude).first;
      final longitude =
          element.userData.map((e) => e.userLocationLongitude).first;
      distance = _distanceHelperCalculate.caculateDistanceToInt(
        currentUserLocation: Location(
          latitude: params.currentUserLocationLatitude,
          longitude: params.currentUserLocationLongitude,
        ),
        serviceProviderLocation: Location(
          latitude: latitude!,
          longitude: longitude!,
        ),
      );
      distances.add(distance);
      log(distances.toString());
    }

    return distances;
  }
}
