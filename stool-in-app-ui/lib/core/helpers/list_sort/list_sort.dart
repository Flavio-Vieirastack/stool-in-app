import 'package:haversine_distance/haversine_distance.dart';
import 'package:stool_in_app_ui/core/helpers/distance_helper/distance_helper_calculate.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';

class ListSort {
  final List<ServiceProviderEntity> serviceProviders;
  final DistanceHelperCalculate distanceHelperCalculate;
  final double currentUserLatitude;
  final double currentUserLongitude;
  ListSort({
    required this.serviceProviders,
    required this.distanceHelperCalculate,
    required this.currentUserLatitude,
    required this.currentUserLongitude,
  });
  List<ServiceProviderEntity> sortServiceProviders() {
    final serviceProviderLatitude = serviceProviders
        .map((e) => e.userData.userLocationLatitude)
        .toList()
        .first;
    final serviceProviderLongitude = serviceProviders
        .map((e) => e.userData.userLocationLongitude)
        .toList()
        .first;
    final distance = distanceHelperCalculate.caculateDistance(
      firstLocation: Location(currentUserLatitude, currentUserLongitude),
      secondLocation:
          Location(serviceProviderLatitude!, serviceProviderLongitude!),
    );
    return [];
  }
}
