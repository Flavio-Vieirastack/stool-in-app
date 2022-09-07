import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../../../mock/services_to_execute_return_payload.dart';

class _RestClientGetMock extends Mock implements RestClientGet {}

class _RestClientDeleteMock extends Mock implements RestClientDelete {}

class _RestClientPostMock extends Mock implements RestClientPost {}

class _RestClientPatchMock extends Mock implements RestClientPatch {}

void main() {
  late _RestClientDeleteMock restClientDeleteMock;
  late _RestClientGetMock restClientGetMock;
  late _RestClientPatchMock restClientPatchMock;
  late _RestClientPostMock restClientPostMock;
  late ServicesToExecuteDatasource servicesToExecuteDatasource;
  late ServicesToExecuteModel servicesToExecuteModelMock;
  setUp(() {
    restClientGetMock = _RestClientGetMock();
    restClientPatchMock = _RestClientPatchMock();
    restClientPostMock = _RestClientPostMock();
    restClientDeleteMock = _RestClientDeleteMock();
    servicesToExecuteModelMock = ServicesToExecuteModel(
      serviceDescription: 'serviceDescription',
      serviceDate: DateTime.now(),
      serviceHour: DateTime.now(),
      userComent: 'userComent',
      status: 'status',
      userName: 'userName',
      userPhotoUrl: 'userPhotoUrl',
      userFirebasePushToken: 'userFirebasePushToken',
      userFirebaseUuid: 'userFirebaseUuid',
      userLocationLatitude: 0,
      userLocationLongintude: 0,
      street: 'street',
      city: 'city',
      userState: 'userState',
      houseNumber: 'houseNumber',
      district: 'district',
      cep: 'cep',
      referencePoint: 'referencePoint',
      servicesTodo: 'servicesTodo',
      total: 50,
    );
    servicesToExecuteDatasource = ServicesToExecuteDatasourceImpl(
      restClientDelete: restClientDeleteMock,
      restClientGet: restClientGetMock,
      restClientPost: restClientPostMock,
      restClientPatch: restClientPatchMock,
    );
  });
  group('createServiceToExecute', () {
    test('Deve retornar void ao criar um service to execute', () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: servicesToExecuteModelMock.toMap()),
      ).thenAnswer(
        (_) async => RestClientResponse(
          statucCode: 200,
          data: {},
        ),
      );
      final sut = servicesToExecuteDatasource.createServiceToExecute(
          servicesToExecuteModel: servicesToExecuteModelMock,
          serviceProviderId: 1);
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o restclient post ao retornar void ao criar um service to execute',
        () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: servicesToExecuteModelMock.toMap()),
      ).thenAnswer(
        (_) async => RestClientResponse(
          statucCode: 200,
          data: {},
        ),
      );
      final sut = servicesToExecuteDatasource.createServiceToExecute(
          servicesToExecuteModel: servicesToExecuteModelMock,
          serviceProviderId: 1);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: servicesToExecuteModelMock.toMap()),
      ).called(1);
    });
    test('Deve retornar um erro ao criar um service to execute', () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: servicesToExecuteModelMock.toMap()),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = servicesToExecuteDatasource.createServiceToExecute;
      expect(
          () async => sut(
              servicesToExecuteModel: servicesToExecuteModelMock,
              serviceProviderId: 1),
          throwsA(isA<ServicesToExecuteError>()));
      verify(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: servicesToExecuteModelMock.toMap()),
      ).called(1);
    });
  });

  group('deleteServiceToExecute', () {
    test('Deve retornar void ao deletar um service to execute', () {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut = servicesToExecuteDatasource.deleteServiceToExecute(
        serviceToExecuteid: 1,
      );
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o rest client delete ao retornar void ao deletar um service to execute',
        () {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut = servicesToExecuteDatasource.deleteServiceToExecute(
        serviceToExecuteid: 1,
      );
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).called(1);
    });
    test('Deve retornar um erro ao deletar um service to execute', () {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = servicesToExecuteDatasource.deleteServiceToExecute;
      expect(
        () async => sut(
          serviceToExecuteid: 1,
        ),
        throwsA(isA<ServicesToExecuteError>()),
      );
    });
  });

  group('getAllServicesToExecute', () {
    test('Deve retornar uma lista de services to execute entity', () async {
      when(
        () => restClientGetMock.get<List>(path: any(named: 'path')),
      ).thenAnswer((_) async =>
          RestClientResponse(statucCode: 200, data: servicesToExecuteReturn));
      final sut = await servicesToExecuteDatasource.getAllServicesToExecute();
      expect(sut, isA<List<ServicesToExecuteEntity>>());
    });
    test(
        'Deve chamar o restclient ao retornar uma lista de services to execute entity',
        () async {
      when(
        () => restClientGetMock.get<List>(path: any(named: 'path')),
      ).thenAnswer((_) async =>
          RestClientResponse(statucCode: 200, data: servicesToExecuteReturn));
      final sut = await servicesToExecuteDatasource.getAllServicesToExecute();
      expect(sut, isA<List<ServicesToExecuteEntity>>());
      verify(
        () => restClientGetMock.get<List>(path: any(named: 'path')),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar uma lista de services to execute entity',
        () async {
      when(
        () => restClientGetMock.get<List>(path: any(named: 'path')),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = servicesToExecuteDatasource.getAllServicesToExecute;
      expect(() async => sut(), throwsA(isA<ServicesToExecuteError>()));
    });
  });

  group('getServicesToExecuteUnique', () {
    test('Deve retornar uma entidade de services to execute', () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenAnswer(
        (_) async => RestClientResponse(
          statucCode: 200,
          data: servicesToExecuteReturnUnique,
        ),
      );
      final sut = await servicesToExecuteDatasource.getServicesToExecuteUnique(
          serviceToExecuteId: 1);
      expect(sut, isA<ServicesToExecuteEntity>());
    });
    test(
        'Deve chamar o restclient get ao retornar uma entidade de services to execute',
        () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenAnswer(
        (_) async => RestClientResponse(
          statucCode: 200,
          data: servicesToExecuteReturnUnique,
        ),
      );
      final sut = await servicesToExecuteDatasource.getServicesToExecuteUnique(
          serviceToExecuteId: 1);
      expect(sut, isA<ServicesToExecuteEntity>());
      verify(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar uma entidade de services to execute',
        () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = servicesToExecuteDatasource.getServicesToExecuteUnique;
      expect(
        () async => sut(serviceToExecuteId: 1),
        throwsA(
          isA<ServicesToExecuteError>(),
        ),
      );
    });
  });

  group('updateServicesToExecute', () {
    test('Deve retornar void ao fazer update de uservice to execute', () async {
      when(
        () => restClientPatchMock.patch(
          path: any(named: 'path'),
          data: servicesToExecuteModelMock.toMap(),
        ),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200, data: {}));
      final sut = servicesToExecuteDatasource.updateServicesToExecute(
        servicesToExecuteModel: servicesToExecuteModelMock,
        serviceToExecuteId: 1,
      );
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o restclient patch ao retornar void ao fazer update de uservice to execute',
        () async {
      when(
        () => restClientPatchMock.patch(
          path: any(named: 'path'),
          data: servicesToExecuteModelMock.toMap(),
        ),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200, data: {}));
      final sut = servicesToExecuteDatasource.updateServicesToExecute(
        servicesToExecuteModel: servicesToExecuteModelMock,
        serviceToExecuteId: 1,
      );
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: servicesToExecuteModelMock.toMap()),
      ).called(1);
    });
    test('Deve retornar um erro ao fazer update de uservice to execute',
        () async {
      when(
        () => restClientPatchMock.patch(
          path: any(named: 'path'),
          data: servicesToExecuteModelMock.toMap(),
        ),
      ).thenThrow(ServicesToExecuteError(message: 'message'));
      final sut = servicesToExecuteDatasource.updateServicesToExecute;
      expect(
        () async => sut(
          servicesToExecuteModel: servicesToExecuteModelMock,
          serviceToExecuteId: 1,
        ),
        throwsA(
          isA<ServicesToExecuteError>(),
        ),
      );
    });
  });
}
