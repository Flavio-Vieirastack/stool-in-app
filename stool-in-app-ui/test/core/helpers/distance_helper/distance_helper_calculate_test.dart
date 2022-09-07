import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_core/stool_in_core.dart';


void main() {
  late DistanceHelperCalculate distanceHelperCalculate;
  setUp(() {
    distanceHelperCalculate = DistanceHelperCalculate();
  });
  test('deve calcular a distância correta em Km retornarndo em int', () {
    final firstLocation =
        Location(latitude: -7.2380874453854, longitude: -39.41323305981678);
    final secondLocation =
        Location(latitude: -7.231148136572121, longitude: -39.40686133322621);
    final sut = distanceHelperCalculate.caculateDistanceToInt(
      currentUserLocation: firstLocation,
      serviceProviderLocation: secondLocation,
    );
    expect(sut, 1045);
  });

  test('deve calcular a distância correta em Metros em int', () {
    final firstLocation =
        Location(latitude: -7.2380874453854, longitude: -39.41323305981678);
    final secondLocation =
        Location(latitude: -7.23429501176811, longitude: -39.41228026263391);
    final sut = distanceHelperCalculate.caculateDistanceToInt(
      currentUserLocation: firstLocation,
      serviceProviderLocation: secondLocation,
    );
    expect(sut, 435);
  });
}
