import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/services_to_execute_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/services_to_execute_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/services_to_execute/services_to_execute_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/services_to_execute/services_to_execute_usecase.dart';
import 'package:stool_in/features/service_provider/domain/usecase/services_to_execute/services_to_execute_usecase_impl.dart';

class _ServicesToExecuteRepositoryMock extends Mock
    implements ServicesToExecuteRepository {}

class _ServicesToExecuteEntityMock extends Mock
    implements ServicesToExecuteEntity {}

void main() {
  late _ServicesToExecuteRepositoryMock servicesToExecuteRepositoryMock;
  late ServicesToExecuteUsecase servicesToExecuteUsecase;
  late _ServicesToExecuteEntityMock servicesToExecuteEntityMock;
  setUp(() {
    servicesToExecuteRepositoryMock = _ServicesToExecuteRepositoryMock();
    servicesToExecuteUsecase = ServicesToExecuteUsecaseImpl(
        servicesToExecuteRepository: servicesToExecuteRepositoryMock);
    servicesToExecuteEntityMock = _ServicesToExecuteEntityMock();
  });
  group('createServiceToExecute', () {
    test('Deve retornar void ao criar um service to execute', () async {
      when(
        () => servicesToExecuteRepositoryMock.createServiceToExecute(
            servicesToExecuteEntity: servicesToExecuteEntityMock,
            serviceProviderId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await servicesToExecuteUsecase.createServiceToExecute(
        servicesToExecuteEntity: servicesToExecuteEntityMock,
        serviceProviderId: 1,
      );
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o repository ao retornar void ao criar um service to execute',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.createServiceToExecute(
            servicesToExecuteEntity: servicesToExecuteEntityMock,
            serviceProviderId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await servicesToExecuteUsecase.createServiceToExecute(
        servicesToExecuteEntity: servicesToExecuteEntityMock,
        serviceProviderId: 1,
      );
      expect(sut, const Right(null));
      verify(
        () => servicesToExecuteRepositoryMock.createServiceToExecute(
          servicesToExecuteEntity: servicesToExecuteEntityMock,
          serviceProviderId: 1,
        ),
      ).called(1);
    });
    test('Deve retornar um erro ao criar um service to execute', () async {
      when(
        () => servicesToExecuteRepositoryMock.createServiceToExecute(
            servicesToExecuteEntity: servicesToExecuteEntityMock,
            serviceProviderId: 1),
      ).thenAnswer(
          (_) async => Left(ServicesToExecuteError(message: 'message')));
      final sut = await servicesToExecuteUsecase.createServiceToExecute(
        servicesToExecuteEntity: servicesToExecuteEntityMock,
        serviceProviderId: 1,
      );
      expect(sut, Left(ServicesToExecuteError(message: 'message')));
    });
  });
}
