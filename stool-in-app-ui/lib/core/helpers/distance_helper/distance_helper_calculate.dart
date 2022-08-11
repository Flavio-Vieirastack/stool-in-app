import 'package:geolocator/geolocator.dart';

class Location {
  final double latitude;
  final double longitude;
  Location({
    required this.latitude,
    required this.longitude,
  });
}

class DistanceHelperCalculate {
  int caculateDistanceToInt({
    required Location currentUserLocation,
    required Location serviceProviderLocation,
  }) {
    final result = Geolocator.distanceBetween(
      currentUserLocation.latitude,
      currentUserLocation.longitude,
      serviceProviderLocation.latitude,
      serviceProviderLocation.longitude,
    );
    return result.round();
  }
}
