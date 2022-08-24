import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:stool_in/features/service_provider/data/datasource/update_service_provider/update_service_provider_datasource.dart';
import 'package:stool_in/features/service_provider/data/datasource/update_service_provider/update_service_provider_datasource_impl.dart';
import 'package:stool_in/features/service_provider/data/model/create_service_provider/create_and_update_service_provider_model.dart';

class RestClientPatchMock extends Mock implements RestClientPatch {}

void main() {
  late RestClientPatchMock restClientPatchMock;
  late UpdateServiceProviderDatasource updateServiceProviderDatasource;
  late CreateAndUpdateServiceProviderModel createAndUpdateServiceProviderModel;
  setUp(() {
    restClientPatchMock = RestClientPatchMock();
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
