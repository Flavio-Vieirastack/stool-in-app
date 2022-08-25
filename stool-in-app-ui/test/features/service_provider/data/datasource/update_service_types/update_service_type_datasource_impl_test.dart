import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/service_provider/data/datasource/update_service_types/update_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/datasource/update_service_types/update_service_type_datasource_impl.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';
import 'package:stool_in/features/service_provider/domain/error/update_service_types_error.dart';

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
