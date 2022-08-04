import 'package:flutter_test/flutter_test.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:stool_in_app_ui/core/helpers/distance_helper/distance_helper_calculate.dart';

void main() {
  late HaversineDistance haversineDistance;
  setUp(() {
    haversineDistance = HaversineDistance();
  });
  test('deve calcular a distância correta em Km', () {
    final firstLocation = Location(-7.2380874453854, -39.41323305981678);
    final secondLocation = Location(-7.231148136572121, -39.40686133322621);
    final sut = DistanceHelperCalculate(
      haversineDistance: haversineDistance,
    ).caculateDistance(
      firstLocation: firstLocation,
      secondLocation: secondLocation,
    );
    expect(sut, '1,04 Km');
  });
  test('deve calcular a distância correta em Km segunda rota', () {
    final firstLocation = Location(-7.2380874453854, -39.41323305981678);
    final secondLocation = Location(-7.224163966512154, -39.31300769356471);
    final sut = DistanceHelperCalculate(
      haversineDistance: haversineDistance,
    ).caculateDistance(
      firstLocation: firstLocation,
      secondLocation: secondLocation,
    );
    expect(sut, '11,1 Km');
  });
  test('deve calcular a distância correta em Metros', () {
    final firstLocation = Location(-7.2380874453854, -39.41323305981678);
    final secondLocation = Location(-7.23429501176811, -39.41228026263391);
    final sut = DistanceHelperCalculate(
      haversineDistance: haversineDistance,
    ).caculateDistance(
      firstLocation: firstLocation,
      secondLocation: secondLocation,
    );
    expect(sut, '434 Metros');
  });
}
