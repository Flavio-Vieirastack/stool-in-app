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
  late List<_ServicesToExecuteEntityMock> servicesToExecuteEntityList;
  late Left<ServicesToExecuteError, dynamic> error;
  setUp(() {
    servicesToExecuteRepositoryMock = _ServicesToExecuteRepositoryMock();
    servicesToExecuteUsecase = ServicesToExecuteUsecaseImpl(
        servicesToExecuteRepository: servicesToExecuteRepositoryMock);
    servicesToExecuteEntityMock = _ServicesToExecuteEntityMock();
    servicesToExecuteEntityList = [_ServicesToExecuteEntityMock()];
    error = Left(ServicesToExecuteError(message: ''));
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
      ).thenAnswer((_) async => error);
      final sut = await servicesToExecuteUsecase.createServiceToExecute(
        servicesToExecuteEntity: servicesToExecuteEntityMock,
        serviceProviderId: 1,
      );
      expect(sut, error);
    });
  });

  group('deleteServiceToExecute', () {
    test('Deve retornar void ao fazer delete do service to execute', () async {
      when(
        () => servicesToExecuteRepositoryMock.deleteServiceToExecute(
            serviceToExecuteid: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await servicesToExecuteUsecase.deleteServiceToExecute(
          serviceToExecuteid: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o repository ao retornar void ao fazer delete do service to execute',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.deleteServiceToExecute(
            serviceToExecuteid: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await servicesToExecuteUsecase.deleteServiceToExecute(
          serviceToExecuteid: 1);
      expect(sut, const Right(null));
      verify(
        () => servicesToExecuteRepositoryMock.deleteServiceToExecute(
            serviceToExecuteid: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao fazer delete do service to execute',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.deleteServiceToExecute(
            serviceToExecuteid: 1),
      ).thenAnswer((_) async => error);
      final sut = await servicesToExecuteUsecase.deleteServiceToExecute(
          serviceToExecuteid: 1);
      expect(sut, error);
    });
  });

  group('getAllServicesToExecute', () {
    test(
        'Deve retornar uma lista da entidade ao fazer get de todos os services to execute',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.getAllServicesToExecute(),
      ).thenAnswer((_) async => Right(servicesToExecuteEntityList));
      final sut = await servicesToExecuteUsecase.getAllServicesToExecute();
      expect(sut, Right(servicesToExecuteEntityList));
    });
    test(
        'Deve chamar o repository ao retornar uma lista da entidade ao fazer get de todos os services to execute',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.getAllServicesToExecute(),
      ).thenAnswer((_) async => Right(servicesToExecuteEntityList));
      final sut = await servicesToExecuteUsecase.getAllServicesToExecute();
      expect(sut, Right(servicesToExecuteEntityList));
      verify(
        () => servicesToExecuteRepositoryMock.getAllServicesToExecute(),
      ).called(1);
    });
    test('Deve retornar um erro ao fazer get de todos os services to execute',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.getAllServicesToExecute(),
      ).thenAnswer((_) async => Left(ServicesToExecuteError(message: '')));
      final sut = await servicesToExecuteUsecase.getAllServicesToExecute();
      expect(sut, Left(ServicesToExecuteError(message: '')));
    });
  });

  group('getServicesToExecuteUnique', () {
    test(
        'Deve retornar uma entidade corretamente ao fazer get dos services to execute unique',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.getServicesToExecuteUnique(
            serviceToExecuteId: 1),
      ).thenAnswer((_) async => Right(servicesToExecuteEntityMock));
      final sut = await servicesToExecuteUsecase.getServicesToExecuteUnique(
          serviceToExecuteId: 1);
      expect(sut, Right(servicesToExecuteEntityMock));
    });
    test(
        'Deve chamar o repository ao retornar uma entidade corretamente ao fazer get dos services to execute unique',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.getServicesToExecuteUnique(
            serviceToExecuteId: 1),
      ).thenAnswer((_) async => Right(servicesToExecuteEntityMock));
      final sut = await servicesToExecuteUsecase.getServicesToExecuteUnique(
          serviceToExecuteId: 1);
      expect(sut, Right(servicesToExecuteEntityMock));
      verify(
        () => servicesToExecuteRepositoryMock.getServicesToExecuteUnique(
            serviceToExecuteId: 1),
      ).called(1);
    });
    test(
        'Deve um erro corretamente ao fazer get dos services to execute unique',
        () async {
      when(
        () => servicesToExecuteRepositoryMock.getServicesToExecuteUnique(
            serviceToExecuteId: 1),
      ).thenAnswer((_) async => Left(ServicesToExecuteError(message: '')));
      final sut = await servicesToExecuteUsecase.getServicesToExecuteUnique(
          serviceToExecuteId: 1);
      expect(sut, Left(ServicesToExecuteError(message: '')));
    });
  });
}
