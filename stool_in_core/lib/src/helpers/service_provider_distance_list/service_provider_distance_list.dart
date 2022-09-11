import 'dart:developer';

import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../stool_in_core.dart';

class ServiceProviderDistanceListCalculate {
  final DistanceHelperCalculate _distanceHelperCalculate;
  ServiceProviderDistanceListCalculate({
    required DistanceHelperCalculate distanceHelperCalculate,
  }) : _distanceHelperCalculate = distanceHelperCalculate;
  List<String> calculateDistance({
    required List<ServiceProviderEntity> serviceProviders,
    required GetServiceProvidersParams params,
  }) {
    final distances = <String>[];
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

      if (distance >= 1000) {
        final convert = distance.toString();
        final lastCharactersRemoved = convert.substring(0, convert.length - 3);
        final format = '$lastCharactersRemoved KM';
        distances.add(format);
      } else {
        final convert = distance.toString();
        final format = '$convert M';
        distances.add(format);
      }
      log(distances.toString());
    }

    return distances;
  }
}
