import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/export/rest_client_export.dart';
import 'package:stool_in/features/home/export/home_export.dart';
import 'package:stool_in/features/service_provider/export/service_provider_export.dart';


class _RestClientPatchMock extends Mock implements RestClientPatch {}

void main() {
  late _RestClientPatchMock restClientPatchMock;
  late UpdateServiceProviderDatasource updateServiceProviderDatasource;
  late CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel;
  setUp(() {
    restClientPatchMock = _RestClientPatchMock();
    createAndUpdateServiceProviderModel = CreateAndUpdateServiceProviderModel();
    updateServiceProviderDatasource = UpdateServiceProviderDatasourceImpl(
        restClientPatch: restClientPatchMock);
  });
  test(
      'Deve retornar void ao fazer update do service provider no satasource impl',
      () async {
    when(
      () => restClientPatchMock.patch(
          path: any(named: 'path'),
          data: createAndUpdateServiceProviderModel.toMap()),
    ).thenAnswer((_) async => RestClientResponse(data: null, statucCode: 200));
    final sut = updateServiceProviderDatasource.call(
        createAndUpdateServiceProviderModel:
            createAndUpdateServiceProviderModel);
    expect(sut, isA<Future<void>>());
  });
  test(
      'Deve retornar um erro ao fazer update do service provider no satasource impl',
      () async {
    when(
      () => restClientPatchMock.patch(
          path: any(named: 'path'),
          data: createAndUpdateServiceProviderModel.toMap()),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut = updateServiceProviderDatasource.call;
    expect(
        () async => sut(
            createAndUpdateServiceProviderModel:
                createAndUpdateServiceProviderModel),
        throwsException);
  });
  test(
      'Deve chamar o restclient patch ao retornar void ao fazer update do service provider no satasource impl',
      () async {
    when(
      () => restClientPatchMock.patch(
          path: any(named: 'path'),
          data: createAndUpdateServiceProviderModel.toMap()),
    ).thenAnswer((_) async => RestClientResponse(data: null, statucCode: 200));
    final sut = updateServiceProviderDatasource.call(
        createAndUpdateServiceProviderModel:
            createAndUpdateServiceProviderModel);
    expect(sut, isA<Future<void>>());
    verify(
      () => restClientPatchMock.patch(
          path: any(named: 'path'),
          data: createAndUpdateServiceProviderModel.toMap()),
    ).called(1);
  });
}
