import 'dart:developer';

import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../stool_in_core.dart';

class ServiceProviderDistanceListCalculate {
  final DistanceHelperCalculate _distanceHelperCalculate;
  final ServiceProviderSortListHelper _serviceProviderSortListHelper;
  ServiceProviderDistanceListCalculate({
    required DistanceHelperCalculate distanceHelperCalculate,
    required ServiceProviderSortListHelper serviceProviderSortListHelper,
  })  : _distanceHelperCalculate = distanceHelperCalculate,
        _serviceProviderSortListHelper = serviceProviderSortListHelper;
  List<String> calculateDistance({
    required List<ServiceProviderEntity> serviceProviders,
    required GetServiceProvidersParams params,
    bool returnSortedByVotes = true,
  }) {
    final distances = <String>[];
    int? distance;
    late var providers = <ServiceProviderEntity>[];
    if (returnSortedByVotes) {
      providers.addAll(_serviceProviderSortListHelper.sortByVotes(
        providers: serviceProviders,
      ));
    } else {
      providers.addAll(
          _serviceProviderSortListHelper.sortList(providers: serviceProviders));
    }
    for (var element in providers) {
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
