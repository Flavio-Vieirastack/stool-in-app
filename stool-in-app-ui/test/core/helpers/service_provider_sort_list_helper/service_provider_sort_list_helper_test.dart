import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/helpers/service_provider_sort_list_helper/service_provider_sort_list_helper.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/coments_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/execution_services_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/services_to_execute_entity.dart';

class ExectionServicesMock extends Mock implements ExecutionServicesEntity {}

class ServicesToExecuteMock extends Mock implements ServicesToExecuteEntity {}

class ComentsMock extends Mock implements ComentsEntity {}

class UserDataMock extends Mock implements UserDataEntity {}

void main() {
  late List<ServiceProviderEntity> serviceProviderEntity;
  late ServiceProviderSortListHelper serviceProviderSortListHelper;
  setUp(
    () {
      serviceProviderSortListHelper = ServiceProviderSortListHelper();
      serviceProviderEntity = [
        ServiceProviderEntity(
          id: 1,
          distance: 435,
          serviceProviderDescription: 'serviceProviderDescription',
          status: 'status',
          initialDisponibleTime: 'initialDisponibleTime',
          endDisponibleTime: 'endDisponibleTime',
          disponibleDays: 'disponibleDays',
          createdAt: DateTime.now(),
          userLoginId: 1,
          votes: 3,
          executionServices: [ExectionServicesMock()],
          servicesToExecute: [ServicesToExecuteMock()],
          coments: [ComentsMock()],
          userData: [UserDataMock()],
        ),
        ServiceProviderEntity(
          id: 1,
          distance: 1,
          serviceProviderDescription: 'serviceProviderDescription',
          status: 'status',
          votes: 3,
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
          votes: 3,
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
    final sut = serviceProviderSortListHelper.sortList(
        providers: serviceProviderEntity).map((e) => e.distance).toList();
    final matcher = [1, 435, 1000, 10000];
    expect(sut, matcher);
  });
}
