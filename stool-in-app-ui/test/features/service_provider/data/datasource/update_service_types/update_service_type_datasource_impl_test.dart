import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


class _RestclientPatchMock extends Mock implements RestClientPatch {}

void main() {
  late _RestclientPatchMock restclientPatchMock;
  late UpdateServiceTypeDatasource updateServiceTypeDatasource;
  late CreateServiceTypeModel createServiceTypeModel;
  setUp(() {
    restclientPatchMock = _RestclientPatchMock();
    createServiceTypeModel = CreateServiceTypeModel(serviceProviderId: 1);
    updateServiceTypeDatasource =
        UpdateServiceTypeDatasourceImpl(restClientPatch: restclientPatchMock);
  });
  test('Deve retornar um future void ao fazer update do service types',
      () async {
    when(
      () => restclientPatchMock.patch(
          path: any(named: 'path'), data: createServiceTypeModel.toMap()),
    ).thenAnswer(
      (_) async => RestClientResponse(data: null, statucCode: 200),
    );
    final sut = updateServiceTypeDatasource.call(
        createServiceTypeModel: createServiceTypeModel);
    expect(sut, isA<Future<void>>());
  });
  test(
      'Deve chamar o restclient patch ao retornar um future void ao fazer update do service types',
      () async {
    when(
      () => restclientPatchMock.patch(
          path: any(named: 'path'), data: createServiceTypeModel.toMap()),
    ).thenAnswer(
      (_) async => RestClientResponse(data: null, statucCode: 200),
    );
    final sut = updateServiceTypeDatasource.call(
        createServiceTypeModel: createServiceTypeModel);
    expect(sut, isA<Future<void>>());
    verify(
      () => restclientPatchMock.patch(
          path: any(named: 'path'), data: createServiceTypeModel.toMap()),
    ).called(1);
  });
  test(
      'Deve retornar um erro ao tentar fazer update do services types',
      () async {
    when(
      () => restclientPatchMock.patch(
          path: any(named: 'path'), data: createServiceTypeModel.toMap()),
    ).thenThrow(UpdateServiceTypesError(message: 'message'));
    final sut = updateServiceTypeDatasource.call;
    expect(() async => sut(createServiceTypeModel: createServiceTypeModel),
        throwsException);
  });
}
