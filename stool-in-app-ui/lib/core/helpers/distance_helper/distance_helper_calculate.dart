import 'package:haversine_distance/haversine_distance.dart';

class DistanceHelperCalculate {
  final HaversineDistance haversineDistance;

  DistanceHelperCalculate({
    required this.haversineDistance,
  });

  String caculateDistance({
    required Location firstLocation,
    required Location secondLocation,
  }) {
    final fistLocation = firstLocation;
    final secondLoaction = secondLocation;
    final result =
        haversineDistance.haversine(fistLocation, secondLoaction, Unit.KM);
    final resultFormat = '${result.toString().substring(0, 4)} Km'.replaceAll(
      '.',
      ',',
    );
    return resultFormat;
  }
}
