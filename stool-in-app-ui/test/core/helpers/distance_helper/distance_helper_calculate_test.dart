import 'package:flutter_test/flutter_test.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:stool_in/core/helpers/distance_helper/distance_helper_calculate.dart';

void main() {
  late HaversineDistance haversineDistance;
  setUp(() {
    haversineDistance = HaversineDistance();
  });
  test('deve calcular a distância correta em Km retornarndo em int', () {
    final firstLocation = Location(-7.2380874453854, -39.41323305981678);
    final secondLocation = Location(-7.231148136572121, -39.40686133322621);
    final sut = DistanceHelperCalculate(
      haversineDistance: haversineDistance,
    ).caculateDistanceToInt(
      firstLocation: firstLocation,
      secondLocation: secondLocation,
    );
    expect(sut, 1.0);
  });

  test('deve calcular a distância correta em Metros em int', () {
    final firstLocation = Location(-7.2380874453854, -39.41323305981678);
    final secondLocation = Location(-7.23429501176811, -39.41228026263391);
    final sut = DistanceHelperCalculate(
      haversineDistance: haversineDistance,
    ).caculateDistanceToInt(
      firstLocation: firstLocation,
      secondLocation: secondLocation,
    );
    expect(sut, -435);
  });
}
