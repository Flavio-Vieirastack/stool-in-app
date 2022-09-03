import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/accepted_payments_entity.dart';


class _ExectionServicesMock extends Mock implements ExecutionServicesEntity {}

class _ServicesToExecuteMock extends Mock implements ServicesToExecuteEntity {}

class _ComentsMock extends Mock implements ComentsEntity {}

class _UserDataMock extends Mock implements UserDataEntity {}
class _AcceptedPaymentsMock extends Mock implements AcceptedPaymentsEntity{}
void main() {
  late ServiceProviderEntity serviceProviderEntityMeters;
  late ServiceProviderEntity serviceProviderEntityKm;
  late ServiceProviderEntity serviceProviderEntityKmDecimal;
  setUp(() {
    serviceProviderEntityMeters = ServiceProviderEntity(
      id: 1,
      votes: 3,
      acceptedPayments: [_AcceptedPaymentsMock()],
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
      acceptedPayments: [_AcceptedPaymentsMock()],
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
      acceptedPayments: [_AcceptedPaymentsMock()],
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
