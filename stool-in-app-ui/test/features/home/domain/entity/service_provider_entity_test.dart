import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/coments_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/execution_services_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/services_to_execute_entity.dart';

class _ExectionServicesMock extends Mock implements ExecutionServicesEntity {}

class _ServicesToExecuteMock extends Mock implements ServicesToExecuteEntity {}

class _ComentsMock extends Mock implements ComentsEntity {}

class _UserDataMock extends Mock implements UserDataEntity {}

void main() {
  late ServiceProviderEntity serviceProviderEntityMeters;
  late ServiceProviderEntity serviceProviderEntityKm;
  late ServiceProviderEntity serviceProviderEntityKmDecimal;
  setUp(() {
    serviceProviderEntityMeters = ServiceProviderEntity(
      id: 1,
      votes: 3,
      distance: 435,
      serviceProviderDescription: 'serviceProviderDescription',
      status: 'status',
      initialDisponibleTime: 'initialDisponibleTime',
      endDisponibleTime: 'endDisponibleTime',
      disponibleDays: 'disponibleDays',
      createdAt: DateTime.now(),
      userLoginId: 1,
      executionServices: [_ExectionServicesMock()],
      servicesToExecute: [_ServicesToExecuteMock()],
      coments: [_ComentsMock()],
      userData: [_UserDataMock()],
    );
    serviceProviderEntityKm = ServiceProviderEntity(
      id: 1,
      distance: 1000,
      votes: 3,
      serviceProviderDescription: 'serviceProviderDescription',
      status: 'status',
      initialDisponibleTime: 'initialDisponibleTime',
      endDisponibleTime: 'endDisponibleTime',
      disponibleDays: 'disponibleDays',
      createdAt: DateTime.now(),
      userLoginId: 1,
      executionServices: [_ExectionServicesMock()],
      servicesToExecute: [_ServicesToExecuteMock()],
      coments: [_ComentsMock()],
      userData: [_UserDataMock()],
    );
    serviceProviderEntityKmDecimal = ServiceProviderEntity(
      id: 1,
      distance: 10000,
      votes: 3,
      serviceProviderDescription: 'serviceProviderDescription',
      status: 'status',
      initialDisponibleTime: 'initialDisponibleTime',
      endDisponibleTime: 'endDisponibleTime',
      disponibleDays: 'disponibleDays',
      createdAt: DateTime.now(),
      userLoginId: 1,
      executionServices: [_ExectionServicesMock()],
      servicesToExecute: [_ServicesToExecuteMock()],
      coments: [_ComentsMock()],
      userData: [_UserDataMock()],
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
