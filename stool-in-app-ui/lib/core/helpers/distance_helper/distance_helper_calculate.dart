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
    if (result >= 1) {
      final resultFormat = '${result.round().toString()} Km'.replaceAll(
        '.',
        ',',
      );
      return resultFormat;
    } else {
      final result =
          haversineDistance.haversine(fistLocation, secondLoaction, Unit.METER);
      final resultFormat =
          '${result.toString().substring(0, 4)} Metros'.replaceAll('.', '');
      return resultFormat;
    }
  }

  double caculateDistanceToDouble({
    required Location firstLocation,
    required Location secondLocation,
  }) {
    final fistLocation = firstLocation;
    final secondLoaction = secondLocation;
    final result =
        haversineDistance.haversine(fistLocation, secondLoaction, Unit.KM);
    if (result >= 1) {
      return result;
    } else {
      final result =
          haversineDistance.haversine(fistLocation, secondLoaction, Unit.METER);

      return result;
    }
  }
}
