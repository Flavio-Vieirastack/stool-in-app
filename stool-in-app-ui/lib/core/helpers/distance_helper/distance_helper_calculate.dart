import 'package:haversine_distance/haversine_distance.dart';

class DistanceHelperCalculate {
  final HaversineDistance haversineDistance;
  final Location firstLocation;
  final Location secondLocation;
  DistanceHelperCalculate({
    required this.firstLocation,
    required this.secondLocation,
    required this.haversineDistance,
  });

  String caculateDistance() {
    final fistLocation = firstLocation;
    final secondLoaction = secondLocation;
    final result =
        haversineDistance.haversine(fistLocation, secondLoaction, Unit.KM);
    final resultFormat = '$result Km';
    return resultFormat;
  }
}
