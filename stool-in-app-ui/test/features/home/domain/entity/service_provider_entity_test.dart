import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/home/domain/entity/coments_entity.dart';
import 'package:stool_in/features/home/domain/entity/execution_services_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/entity/services_to_execute_entity.dart';

class ExectionServicesMock extends Mock implements ExecutionServicesEntity {}

class ServicesToExecuteMock extends Mock implements ServicesToExecuteEntity {}

class ComentsMock extends Mock implements ComentsEntity {}

class AuthEntityMock extends Mock implements AuthEntity {}

void main() {
  late ServiceProviderEntity serviceProviderEntityMeters;
  late ServiceProviderEntity serviceProviderEntityKm;
  late ServiceProviderEntity serviceProviderEntityKmDecimal;
  setUp(() {
    serviceProviderEntityMeters = ServiceProviderEntity(
      id: 1,
      distance: 435,
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
      authEntity: AuthEntityMock(),
    );
    serviceProviderEntityKm = ServiceProviderEntity(
      id: 1,
      distance: 1000,
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
      authEntity: AuthEntityMock(),
    );
    serviceProviderEntityKmDecimal = ServiceProviderEntity(
      id: 1,
      distance: 10000,
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
      authEntity: AuthEntityMock(),
    );
  });
  test('Deve retornar a distância formatada corretamente em KM', () {
    final result = serviceProviderEntityMeters.distanceFormat();
    const matcher = '435 M';
    expect(result, matcher);
  });
  test('Deve retornar a distância formatada corretamente em Metros', () {
    final result = serviceProviderEntityKm.distanceFormat();
    const matcher = '1 KM';
    expect(result, matcher);
  });
  test('Deve retornar a distância formatada corretamente em Metros', () {
    final result = serviceProviderEntityKmDecimal.distanceFormat();
    const matcher = '10 KM';
    expect(result, matcher);
  });
}
