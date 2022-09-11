import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class _ServiceProviderUseCaseMock extends Mock
    implements GetServiceProviderUsecase {}

class _ExecutionServicesEntityMock extends Mock
    implements ExecutionServicesEntity {}

class _ServicesToExecuteEntityMock extends Mock
    implements ServicesToExecuteEntity {}

class _ComentsEntityMock extends Mock implements ComentsEntity {}

class _UserDataEntityMock extends Mock implements UserDataEntity {}

class _ServiceRepositoryMock extends Mock
    implements GetServiceProviderRepository {}

class _AcceptedPaymentsMock extends Mock implements AcceptedPaymentsEntity {}

void main() {
  late _ServiceProviderUseCaseMock usecaseMock;
  late _ExecutionServicesEntityMock executionServicesEntityMock;
  late _ServicesToExecuteEntityMock servicesToExecuteEntityMock;
  late _ComentsEntityMock comentsEntityMock;
  late _UserDataEntityMock userDataEntityMock;
  late _ServiceRepositoryMock serviceRepositoryMock;
  late List<ServiceProviderEntity> serviceProviderEntity;
  setUp(
    () {
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
          acceptedPayments: [_AcceptedPaymentsMock()],
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
        () => usecaseMock.call(pageQuantity: 5),
      ).thenAnswer(
        (_) async => Right(serviceProviderEntity),
      );
      final sut = await usecaseMock.call(pageQuantity: 5);
      expect(sut, Right(serviceProviderEntity));
    },
  );
  test(
    'Deve retornar um erro da instãncia correta',
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
    'Deve chamar o repository correto',
    () async {
      final useCaseImpl = GetServiceProviderUsecaseImpl(
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
