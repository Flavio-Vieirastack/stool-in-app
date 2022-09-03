import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/service_provider/data/datasource/service_provider_coments/service_provider_coments_datasource.dart';
import 'package:stool_in/features/service_provider/data/datasource/service_provider_coments/service_provider_coments_datasource_impl.dart';
import 'package:stool_in/features/service_provider/domain/error/coments_error.dart';

import '../../../../../mock/coments_model_payload_mock.dart';

class _RestClientGetMock extends Mock implements RestClientGet {}

class _RestClientDeleteMock extends Mock implements RestClientDelete {}

class _RestClientPostMock extends Mock implements RestClientPost {}

class _RestClientPatchMock extends Mock implements RestClientPatch {}

void main() {
  late _RestClientDeleteMock restClientDeleteMock;
  late _RestClientGetMock restClientGetMock;
  late _RestClientPatchMock restClientPatchMock;
  late _RestClientPostMock restClientPostMock;
  late ServiceProviderComentsDatasource serviceProviderComentsDatasource;
  late ComentsModel comentsModel;
  setUp(() {
    restClientDeleteMock = _RestClientDeleteMock();
    restClientGetMock = _RestClientGetMock();
    restClientPatchMock = _RestClientPatchMock();
    restClientPostMock = _RestClientPostMock();
    serviceProviderComentsDatasource = ServiceProviderComentsDatasourceImpl(
      restClientDelete: restClientDeleteMock,
      restClientGet: restClientGetMock,
      restClientPatch: restClientPatchMock,
      restClientPost: restClientPostMock,
    );
    comentsModel = ComentsModel();
  });
  group('createComent', () {
    test('Deve retornar void ao criar um comentario no datasource impl',
        () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: comentsModel.toMap()),
      ).thenAnswer(
        (_) async => RestClientResponse(
          statucCode: 200,
        ),
      );
      final sut = serviceProviderComentsDatasource.createComent(
          comentsModel: comentsModel, serviceProviderId: 1);
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o restclient post ao retornar void ao criar um comentario no datasource impl',
        () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: comentsModel.toMap()),
      ).thenAnswer(
        (_) async => RestClientResponse(
          statucCode: 200,
        ),
      );
      final sut = serviceProviderComentsDatasource.createComent(
          comentsModel: comentsModel, serviceProviderId: 1);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientPostMock.post(
          path: any(named: 'path'),
          data: comentsModel.toMap(),
        ),
      );
    });
    test('Deve retornar um erro ao criar um comentario no datasource impl',
        () async {
      when(
        () => restClientPostMock.post(
            path: any(named: 'path'), data: comentsModel.toMap()),
      ).thenThrow(ComentsError(message: 'message'));
      final sut = serviceProviderComentsDatasource.createComent;
      expect(() async => sut(comentsModel: comentsModel, serviceProviderId: 1),
          throwsA(isA<ComentsError>()));
    });
  });
  group('deleteComent', () {
    test('Deve retornar void ao deletar um comentario no datasource impl',
        () async {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut = serviceProviderComentsDatasource.deleteComent(comentId: 1);
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o restclient delete ao retornar void ao deletar um comentario no datasource impl',
        () async {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut = serviceProviderComentsDatasource.deleteComent(comentId: 1);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).called(1);
    });
    test('Deve retornar um erro ao deletar um comentario no datasource impl',
        () async {
      when(
        () => restClientDeleteMock.delete(path: any(named: 'path')),
      ).thenThrow(ComentsError(message: 'message'));
      final sut = serviceProviderComentsDatasource.deleteComent;
      expect(() async => sut(comentId: 1), throwsA(isA<ComentsError>()));
    });
  });
  group('getAllMyComents', () {
    test(
        'Deve retornar uma lista de coments entity ao fazer get all no datasource impl',
        () async {
      when(
        () => restClientGetMock.get<List>(path: any(named: 'path')),
      ).thenAnswer((_) async =>
          RestClientResponse(statucCode: 200, data: comentsModelListPayload));
      final sut = await serviceProviderComentsDatasource.getAllMyComents();
      expect(sut, isA<List<ComentsEntity>>());
    });
    test(
        'Deve chamar o restclient get ao retornar uma lista de coments entity ao fazer get all no datasource impl',
        () async {
      when(
        () => restClientGetMock.get<List>(path: any(named: 'path')),
      ).thenAnswer((_) async =>
          RestClientResponse(statucCode: 200, data: comentsModelListPayload));
      final sut = await serviceProviderComentsDatasource.getAllMyComents();
      expect(sut, isA<List<ComentsEntity>>());
      verify(
        () => restClientGetMock.get<List>(path: any(named: 'path')),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar uma lista de coments entity ao fazer get all no datasource impl',
        () async {
      when(
        () => restClientGetMock.get<List>(path: any(named: 'path')),
      ).thenThrow(ComentsError(message: 'message'));
      final sut = serviceProviderComentsDatasource.getAllMyComents;
      expect(() async => sut(), throwsA(isA<ComentsError>()));
    });
  });
  group('getUniqueComent', () {
    test(
        'Deve retornar uma entidade de coments entity ao fazer get unique no datasource impl',
        () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenAnswer((_) async =>
          RestClientResponse(statucCode: 200, data: comentsModelPayload));
      final sut =
          await serviceProviderComentsDatasource.getUniqueComent(comentId: 1);
      expect(sut, isA<ComentsEntity>());
    });
    test(
        'Deve chamar o restclient get ao retornar uma entidade de coments entity ao fazer get unique no datasource impl',
        () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenAnswer((_) async =>
          RestClientResponse(statucCode: 200, data: comentsModelPayload));
      final sut =
          await serviceProviderComentsDatasource.getUniqueComent(comentId: 1);
      expect(sut, isA<ComentsEntity>());
      verify(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar uma entidade de coments entity ao fazer get unique no datasource impl',
        () async {
      when(
        () => restClientGetMock.get(path: any(named: 'path')),
      ).thenThrow(ComentsError(message: 'message'));
      final sut = serviceProviderComentsDatasource.getUniqueComent;
      expect(() async => sut(comentId: 1), throwsA(isA<ComentsError>()));
    });
  });
  group('updateComent', () {
    test(
        'Deve retornar void ao fazer update de um comentario no datasource impl',
        () async {
      when(() => restClientPatchMock.patch(
              path: any(named: 'path'), data: comentsModel.toMap()))
          .thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut = serviceProviderComentsDatasource.updateComent(
          comentsModel: comentsModel, serviceProviderId: 1);
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o restclient patch ao retornar void ao fazer update de um comentario no datasource impl',
        () async {
      when(() => restClientPatchMock.patch(
              path: any(named: 'path'), data: comentsModel.toMap()))
          .thenAnswer((_) async => RestClientResponse(statucCode: 200));
      final sut = serviceProviderComentsDatasource.updateComent(
          comentsModel: comentsModel, serviceProviderId: 1);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: comentsModel.toMap()),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao fazer update de um comentario no datasource impl',
        () async {
      when(() => restClientPatchMock.patch(
              path: any(named: 'path'), data: comentsModel.toMap()))
          .thenThrow(ComentsError(message: 'message'));
      final sut = serviceProviderComentsDatasource.updateComent;
      expect(() async => sut(comentsModel: comentsModel, serviceProviderId: 1),
          throwsA(isA<ComentsError>()));
    });
  });
}
