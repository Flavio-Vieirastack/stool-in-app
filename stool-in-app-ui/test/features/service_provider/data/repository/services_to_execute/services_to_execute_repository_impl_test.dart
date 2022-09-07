import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


class _ServiceToExecuteDatasourceMock extends Mock
    implements ServicesToExecuteDatasource {}

class _ServicesToExecuteEntity extends Mock implements ServicesToExecuteEntity {
}

void main() {
  late _ServiceToExecuteDatasourceMock serviceToExecuteDatasourceMock;
  late ServicesToExecuteRepository servicesToExecuteRepository;
  late _ServicesToExecuteEntity servicesToExecuteEntity;
  late List<_ServicesToExecuteEntity> serviceToExecuteEntityList;
  setUp(() {
    serviceToExecuteDatasourceMock = _ServiceToExecuteDatasourceMock();
    servicesToExecuteRepository = ServicesToExecuteRepositoryImpl(
        servicesToExecuteDatasource: serviceToExecuteDatasourceMock);
    servicesToExecuteEntity = _ServicesToExecuteEntity();
    serviceToExecuteEntityList = [_ServicesToExecuteEntity()];
    registerFallbackValue(
      ServicesToExecuteModel.fromEntity(
        servicesToExecuteEntity: servicesToExecuteEntity,
      ),
    );
  });
  group('createServiceToExecute', () {
    test('Deve retornar void ao criar um serviço no repository impl', () async {
      when(
        () => serviceToExecuteDatasourceMock.createServiceToExecute(
          servicesToExecuteModel: any(named: 'servicesToExecuteModel'),
          serviceProviderId: 1,
        ),
      ).thenAnswer((_) async => Future.value());
      final sut = await servicesToExecuteRepository.createServiceToExecute(
          servicesToExecuteEntity: servicesToExecuteEntity,
          serviceProviderId: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasource ao retornar void ao criar um serviço no repository impl',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.createServiceToExecute(
          servicesToExecuteModel: any(named: 'servicesToExecuteModel'),
          serviceProviderId: 1,
        ),
      ).thenAnswer((_) async => Future.value());
      final sut = await servicesToExecuteRepository.createServiceToExecute(
          servicesToExecuteEntity: servicesToExecuteEntity,
          serviceProviderId: 1);
      expect(sut, const Right(null));
      verify(
        () => serviceToExecuteDatasourceMock.createServiceToExecute(
            servicesToExecuteModel: any(named: 'servicesToExecuteModel'),
            serviceProviderId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao criar um serviço no repository impl',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.createServiceToExecute(
          servicesToExecuteModel: any(named: 'servicesToExecuteModel'),
          serviceProviderId: 1,
        ),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = await servicesToExecuteRepository.createServiceToExecute(
          servicesToExecuteEntity: servicesToExecuteEntity,
          serviceProviderId: 1);
      expect(sut, Left(ServicesToExecuteError(message: 'message')));
    });
  });

  group('deleteServiceToExecute', () {
    test('Deve retornar void ao deletar um serviço no repository', () async {
      when(
        () => serviceToExecuteDatasourceMock.deleteServiceToExecute(
            serviceToExecuteid: 1),
      ).thenAnswer((_) => Future.value());
      final sut = await servicesToExecuteRepository.deleteServiceToExecute(
          serviceToExecuteid: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasource ao retornar void ao deletar um serviço no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.deleteServiceToExecute(
            serviceToExecuteid: 1),
      ).thenAnswer((_) => Future.value());
      final sut = await servicesToExecuteRepository.deleteServiceToExecute(
          serviceToExecuteid: 1);
      expect(sut, const Right(null));
      verify(
        () => serviceToExecuteDatasourceMock.deleteServiceToExecute(
            serviceToExecuteid: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao deletar um serviço no repository', () async {
      when(
        () => serviceToExecuteDatasourceMock.deleteServiceToExecute(
            serviceToExecuteid: 1),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = await servicesToExecuteRepository.deleteServiceToExecute(
          serviceToExecuteid: 1);
      expect(sut, Left(ServicesToExecuteError(message: 'message')));
    });
  });

  group('getAllServicesToExecute', () {
    test(
        'Deve retornar uma lista da entidade ao fazer get de todos os serviços no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.getAllServicesToExecute(),
      ).thenAnswer((_) async => serviceToExecuteEntityList);
      final sut = await servicesToExecuteRepository.getAllServicesToExecute();
      expect(sut, Right(serviceToExecuteEntityList));
    });
    test(
        'Deve chamar o datasource ao retornar uma lista da entidade ao fazer get de todos os serviços no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.getAllServicesToExecute(),
      ).thenAnswer((_) async => serviceToExecuteEntityList);
      final sut = await servicesToExecuteRepository.getAllServicesToExecute();
      expect(sut, Right(serviceToExecuteEntityList));
      verify(
        () => serviceToExecuteDatasourceMock.getAllServicesToExecute(),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao fazer get de todos os serviços no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.getAllServicesToExecute(),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = await servicesToExecuteRepository.getAllServicesToExecute();
      expect(sut, Left(ServicesToExecuteError(message: 'message')));
    });
  });

  group('getServicesToExecuteUnique', () {
    test(
        'Deve retornar uma entidade de service to execute correta ao fazer get unique no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.getServicesToExecuteUnique(
            serviceToExecuteId: 1),
      ).thenAnswer((_) async => servicesToExecuteEntity);
      final sut = await servicesToExecuteRepository.getServicesToExecuteUnique(
          serviceToExecuteId: 1);
      expect(sut, Right(servicesToExecuteEntity));
    });
    test(
        'Deve chamar o datasource ao retornar uma entidade de service to execute correta ao fazer get unique no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.getServicesToExecuteUnique(
            serviceToExecuteId: 1),
      ).thenAnswer((_) async => servicesToExecuteEntity);
      final sut = await servicesToExecuteRepository.getServicesToExecuteUnique(
          serviceToExecuteId: 1);
      expect(sut, Right(servicesToExecuteEntity));
      verify(
        () => serviceToExecuteDatasourceMock.getServicesToExecuteUnique(
            serviceToExecuteId: 1),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao fazer get unique dos services to execute no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.getServicesToExecuteUnique(
            serviceToExecuteId: 1),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = await servicesToExecuteRepository.getServicesToExecuteUnique(
          serviceToExecuteId: 1);
      expect(sut, Left(ServicesToExecuteError(message: 'message')));
    });
  });

  group('updateServicesToExecute', () {
    test('Deve retornar void ao fazer update dos serviços no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.updateServicesToExecute(
            servicesToExecuteModel: any(named: 'servicesToExecuteModel'),
            serviceToExecuteId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut = await servicesToExecuteRepository.updateServicesToExecute(
          servicesToExecuteEntity: servicesToExecuteEntity,
          serviceToExecuteId: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasource ao retornar void ao fazer update dos serviços no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.updateServicesToExecute(
            servicesToExecuteModel: any(named: 'servicesToExecuteModel'),
            serviceToExecuteId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut = await servicesToExecuteRepository.updateServicesToExecute(
          servicesToExecuteEntity: servicesToExecuteEntity,
          serviceToExecuteId: 1);
      expect(sut, const Right(null));
      verify(
        () => serviceToExecuteDatasourceMock.updateServicesToExecute(
            servicesToExecuteModel: any(named: 'servicesToExecuteModel'),
            serviceToExecuteId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao fazer update dos serviços no repository',
        () async {
      when(
        () => serviceToExecuteDatasourceMock.updateServicesToExecute(
            servicesToExecuteModel: any(named: 'servicesToExecuteModel'),
            serviceToExecuteId: 1),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = await servicesToExecuteRepository.updateServicesToExecute(
          servicesToExecuteEntity: servicesToExecuteEntity,
          serviceToExecuteId: 1);
      expect(sut, Left(ServicesToExecuteError(message: 'message')));
    });
  });
}
