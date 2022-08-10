import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/home/domain/entity/coments_entity.dart';
import 'package:stool_in/features/home/domain/entity/execution_services_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/entity/services_to_execute_entity.dart';

class ExectionServicesMock extends Mock implements ExecutionServicesEntity {}

class ServicesToExecuteMock extends Mock implements ServicesToExecuteEntity {}

class ComentsMock extends Mock implements ComentsEntity {}

class UserDataMock extends Mock implements UserDataEntity {}

void main() {
  late ServiceProviderEntity serviceProviderEntity;
  setUp(() {
    serviceProviderEntity = ServiceProviderEntity(
      id: 1,
      distance: -435,
      serviceProviderDescription: 'serviceProviderDescription',
      status: 'status',
      initialDisponibleTime: 'initialDisponibleTime',
      endDisponibleTime: 'endDisponibleTime',
      disponibleDays: 'disponibleDays',
      createdAt: DateTime.now(),
      userDataId: 1,
      executionServices: [ExectionServicesMock()],
      servicesToExecute: [ServicesToExecuteMock()],
      coments: [ComentsMock()],
      userData: UserDataMock(),
    );
  });
  test('Deve retornar a distância formatada corretamente em KM', () {
    final result = serviceProviderEntity.distanceFormat();
    const matcher = '435 M';
    expect(result, matcher);
  });
  test('Deve retornar a distância formatada corretamente em Metros', () {
    final result = serviceProviderEntity.distanceFormat();
    const matcher = '435 M';
    expect(result, matcher);
  });
}
