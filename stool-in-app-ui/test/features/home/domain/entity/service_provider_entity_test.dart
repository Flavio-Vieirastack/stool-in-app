import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';



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
}
