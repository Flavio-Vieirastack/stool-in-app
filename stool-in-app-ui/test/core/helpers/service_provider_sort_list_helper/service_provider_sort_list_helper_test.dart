import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/accepted_payments_entity.dart';

class ExectionServicesMock extends Mock implements ExecutionServicesEntity {}

class ServicesToExecuteMock extends Mock implements ServicesToExecuteEntity {}

class ComentsMock extends Mock implements ComentsEntity {}

class UserDataMock extends Mock implements UserDataEntity {}
class AcceptedPaymentsMock extends Mock implements AcceptedPaymentsEntity{}
void main() {
  late List<ServiceProviderEntity> serviceProviderEntity;
  late ServiceProviderSortListHelper serviceProviderSortListHelper;
  setUp(
    () {
      serviceProviderSortListHelper = ServiceProviderSortListHelper();
      serviceProviderEntity = [
        ServiceProviderEntity(
          id: 1,
          acceptedPayments: [AcceptedPaymentsMock()],
          distance: 435,
          serviceProviderDescription: 'serviceProviderDescription',
          status: 'status',
          initialDisponibleTime: 'initialDisponibleTime',
          endDisponibleTime: 'endDisponibleTime',
          disponibleDays: 'disponibleDays',
          createdAt: DateTime.now(),
          userLoginId: 1,
          votes: 5,
          executionServices: [ExectionServicesMock()],
          servicesToExecute: [ServicesToExecuteMock()],
          coments: [ComentsMock()],
          userData: [UserDataMock()],
        ),
        ServiceProviderEntity(
          id: 1,
          acceptedPayments: [AcceptedPaymentsMock()],
          distance: 1,
          serviceProviderDescription: 'serviceProviderDescription',
          status: 'status',
          votes: 4,
          initialDisponibleTime: 'initialDisponibleTime',
          endDisponibleTime: 'endDisponibleTime',
          disponibleDays: 'disponibleDays',
          createdAt: DateTime.now(),
          userLoginId: 1,
          executionServices: [ExectionServicesMock()],
          servicesToExecute: [ServicesToExecuteMock()],
          coments: [ComentsMock()],
          userData: [UserDataMock()],
        ),
        ServiceProviderEntity(
          id: 1,
          distance: 1000,
          votes: 3,
          acceptedPayments: [AcceptedPaymentsMock()],
          serviceProviderDescription: 'serviceProviderDescription',
          status: 'status',
          initialDisponibleTime: 'initialDisponibleTime',
          endDisponibleTime: 'endDisponibleTime',
          disponibleDays: 'disponibleDays',
          createdAt: DateTime.now(),
          userLoginId: 1,
          executionServices: [ExectionServicesMock()],
          servicesToExecute: [ServicesToExecuteMock()],
          coments: [ComentsMock()],
          userData: [UserDataMock()],
        ),
        ServiceProviderEntity(
          id: 1,
          distance: 10000,
          votes: 2,
          acceptedPayments: [AcceptedPaymentsMock()],
          serviceProviderDescription: 'serviceProviderDescription',
          status: 'status',
          initialDisponibleTime: 'initialDisponibleTime',
          endDisponibleTime: 'endDisponibleTime',
          disponibleDays: 'disponibleDays',
          createdAt: DateTime.now(),
          userLoginId: 1,
          executionServices: [ExectionServicesMock()],
          servicesToExecute: [ServicesToExecuteMock()],
          coments: [ComentsMock()],
          userData: [UserDataMock()],
        ),
      ];
    },
  );
  test('Deve ordernar corretamente a lista baseado na distãncia', () {
    final sut = serviceProviderSortListHelper
        .sortList(providers: serviceProviderEntity)
        .map((e) => e.distance)
        .toList();
    final matcher = [1, 435, 1000, 10000];
    expect(sut, matcher);
  });

  test('Deve retornar os service providers baseados nos votos', () {
    final sut = serviceProviderSortListHelper
        .sortByVotes(providers: serviceProviderEntity)
        .map((e) => e.votes)
        .toList();
    final matcher = [5, 4, 3, 2];
    expect(sut, matcher);
  });
 
}
