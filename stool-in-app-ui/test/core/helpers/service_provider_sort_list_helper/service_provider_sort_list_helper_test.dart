import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/helpers/service_provider_sort_list_helper/service_provider_sort_list_helper.dart';
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
          userDataId: 1,
          executionServices: [ExectionServicesMock()],
          servicesToExecute: [ServicesToExecuteMock()],
          coments: [ComentsMock()],
          authEntity: AuthEntityMock(),
        ),
        ServiceProviderEntity(
          id: 1,
          distance: 1,
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
        ),
        ServiceProviderEntity(
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
        ),
        ServiceProviderEntity(
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
