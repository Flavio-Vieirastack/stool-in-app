import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/coments_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/execution_services_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/services_to_execute_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/error/service_provider_error.dart';
import 'package:stool_in_app_ui/features/home/domain/repository/service_provider_repository.dart';
import 'package:stool_in_app_ui/features/home/domain/usecase/service_provider_usecase.dart';
import 'package:stool_in_app_ui/features/home/domain/usecase/service_provider_usecase_impl.dart';

class ServiceProviderUseCaseMock extends Mock
    implements ServiceProviderUsecase {}

class ExecutionServicesEntityMock extends Mock
    implements ExecutionServicesEntity {}

class ServicesToExecuteEntityMock extends Mock
    implements ServicesToExecuteEntity {}

class ComentsEntityMock extends Mock implements ComentsEntity {}

class UserDataEntityMock extends Mock implements UserDataEntity {}

class ServiceRepositoryMock extends Mock implements ServiceProviderRepository {}

void main() {
  late ServiceProviderUseCaseMock usecaseMock;
  late ExecutionServicesEntityMock executionServicesEntityMock;
  late ServicesToExecuteEntityMock servicesToExecuteEntityMock;
  late ComentsEntityMock comentsEntityMock;
  late UserDataEntityMock userDataEntityMock;
  late ServiceRepositoryMock serviceRepositoryMock;
  late List<ServiceProviderEntity> serviceProviderEntity;
  setUp(
    () {
      usecaseMock = ServiceProviderUseCaseMock();
      executionServicesEntityMock = ExecutionServicesEntityMock();
      servicesToExecuteEntityMock = ServicesToExecuteEntityMock();
      comentsEntityMock = ComentsEntityMock();
      userDataEntityMock = UserDataEntityMock();
      serviceRepositoryMock = ServiceRepositoryMock();
      serviceProviderEntity = [
        ServiceProviderEntity(
          id: 1,
          serviceProviderDescription: 'serviceProviderDescription',
          status: 'status',
          initialDisponibleTime: 'initialDisponibleTime',
          endDisponibleTime: 'endDisponibleTime',
          disponibleDays: 'disponibleDays',
          createdAt: DateTime.now(),
          userDataId: '1',
          executionServices: [executionServicesEntityMock],
          servicesToExecute: [servicesToExecuteEntityMock],
          coments: [comentsEntityMock],
          userData: [userDataEntityMock],
        ),
      ];
    },
  );
  test(
    'Deve retornar uma lista de entidades',
    () async {
      when(
        () => usecaseMock.call(pageQuantity: 5),
      ).thenAnswer(
        (_) async => Right(serviceProviderEntity),
      );
      final sut = await usecaseMock.call(pageQuantity: 5);
      expect(sut, Right(serviceProviderEntity));
    },
  );
  test(
    'Deve retornar um erro',
    () async {
      when(
        () => usecaseMock.call(pageQuantity: 5),
      ).thenAnswer(
        (_) async => Left(ServiceProviderError(message: 'message')),
      );
      final sut = usecaseMock.call;
      expect(
        await sut(pageQuantity: 5),
        Left(
          ServiceProviderError(message: 'message'),
        ),
      );
    },
  );
  test(
    'Deve chamar o repository',
    () async {
      final useCaseImpl = ServiceProviderUsecaseImpl(
          serviceProviderRepository: serviceRepositoryMock);
      when(
        () => serviceRepositoryMock.call(pageQuantity: 5),
      ).thenAnswer((_) async => Right(serviceProviderEntity));
      final sut = await useCaseImpl.call(pageQuantity: 5);
      expect(sut, Right(serviceProviderEntity));
      verify(
        () => serviceRepositoryMock.call(pageQuantity: 5),
      ).called(1);
    },
  );
}
