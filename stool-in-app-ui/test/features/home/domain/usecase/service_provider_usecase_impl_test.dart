import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/coments_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/execution_services_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/services_to_execute_entity.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:stool_in/features/home/domain/repository/service_provider/service_provider_repository.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider/service_provider_usecase.dart';
import 'package:stool_in/features/home/domain/usecase/service_provider/service_provider_usecase_impl.dart';

class _ServiceProviderUseCaseMock extends Mock
    implements GetServiceProviderUsecase {}

class _ExecutionServicesEntityMock extends Mock
    implements ExecutionServicesEntity {}

class _ServicesToExecuteEntityMock extends Mock
    implements ServicesToExecuteEntity {}

class _ComentsEntityMock extends Mock implements ComentsEntity {}

class _UserDataEntityMock extends Mock implements UserDataEntity {}

class _ServiceRepositoryMock extends Mock implements GetServiceProviderRepository {}

void main() {
  late _ServiceProviderUseCaseMock usecaseMock;
  late _ExecutionServicesEntityMock executionServicesEntityMock;
  late _ServicesToExecuteEntityMock servicesToExecuteEntityMock;
  late _ComentsEntityMock comentsEntityMock;
  late _UserDataEntityMock userDataEntityMock;
  late _ServiceRepositoryMock serviceRepositoryMock;
  late List<ServiceProviderEntity> serviceProviderEntity;
  late GetServiceProvidersParams params;
  setUp(
    () {
      params = GetServiceProvidersParams(
          pageQuantity: 5,
          currentUserLocationLatitude: 50.0,
          currentUserLocationLongitude: 50.0);
      usecaseMock = _ServiceProviderUseCaseMock();
      executionServicesEntityMock = _ExecutionServicesEntityMock();
      servicesToExecuteEntityMock = _ServicesToExecuteEntityMock();
      comentsEntityMock = _ComentsEntityMock();
      userDataEntityMock = _UserDataEntityMock();
      serviceRepositoryMock = _ServiceRepositoryMock();
      serviceProviderEntity = [
        ServiceProviderEntity(
          id: 1,
          distance: 50,
          serviceProviderDescription: 'serviceProviderDescription',
          status: 'status',
          initialDisponibleTime: 'initialDisponibleTime',
          endDisponibleTime: 'endDisponibleTime',
          disponibleDays: 'disponibleDays',
          createdAt: DateTime.now(),
          userLoginId: 1,
          votes: 3,
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
        () => usecaseMock.call(providersParams: params),
      ).thenAnswer(
        (_) async => Right(serviceProviderEntity),
      );
      final sut = await usecaseMock.call(providersParams: params);
      expect(sut, Right(serviceProviderEntity));
    },
  );
  test(
    'Deve retornar um erro da instãncia correta',
    () async {
      when(
        () => usecaseMock.call(providersParams: params),
      ).thenAnswer(
        (_) async => Left(ServiceProviderError(message: 'message')),
      );
      final sut = usecaseMock.call;
      expect(
        await sut(providersParams: params),
        Left(
          ServiceProviderError(message: 'message'),
        ),
      );
    },
  );
  test(
    'Deve chamar o repository correto',
    () async {
      final useCaseImpl = GetServiceProviderUsecaseImpl(
          serviceProviderRepository: serviceRepositoryMock);
      when(
        () => serviceRepositoryMock.call(providersParams: params),
      ).thenAnswer((_) async => Right(serviceProviderEntity));
      final sut = await useCaseImpl.call(providersParams: params);
      expect(sut, Right(serviceProviderEntity));
      verify(
        () => serviceRepositoryMock.call(providersParams: params),
      ).called(1);
    },
  );
}
