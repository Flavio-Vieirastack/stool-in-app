import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/service_provider/data/datasource/create_service_type/create_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/datasource/create_service_type/create_service_type_datasource_impl.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_type_error.dart';

import '../../../../../mock/service_types_return_enty_payload_mock.dart';

class _RestclientPostMock extends Mock implements RestClientPost {}

void main() {
  late _RestclientPostMock restclientPostMock;
  late CreateServiceTypeModel data;
  late CreateServiceTypeDatasource createServiceTypeDatasource;
  late ServiceTypesReturnEntity serviceTypesReturnEntity;
  setUp(() {
    restclientPostMock = _RestclientPostMock();
    createServiceTypeDatasource =
        CreateServiceTypeDatasourceImpl(restClientPost: restclientPostMock);
    data = CreateServiceTypeModel(
      serviceProviderId: 1,
      estimatedHours: 1,
      price: 50.0,
      serviceName: 'Diferente2',
    );
    serviceTypesReturnEntity = ServiceTypesReturnEntity(
      serviceProviderId: 1,
      serviceTypeId: 2,
      estimatedHours: 1,
      price: 50.0,
      serviceName: 'Diferente2',
    );
  });
  test('Deve retornar um serviceTypesReturnEntity corretamente no datasource',
      () async {
    when(
      () =>
          restclientPostMock.post(path: any(named: 'path'), data: data.toMap()),
    ).thenAnswer((_) async => RestClientResponse(
          data: servicesTypePayload,
          statucCode: 200,
        ));
    final sut =
        await createServiceTypeDatasource.call(createServiceTypeModel: data);
    expect(sut, serviceTypesReturnEntity);
  });
  test(
      'Deve retornar um erro ao tentar retornar serviceTypesReturnEntity corretamente no datasource',
      () async {
    when(
      () =>
          restclientPostMock.post(path: any(named: 'path'), data: data.toMap()),
    ).thenThrow(CreateServiceTypeError(message: 'message'));
    final sut = createServiceTypeDatasource.call;
    expect(() async => sut(createServiceTypeModel: data),
        throwsException);
  });
  test(
      'Deve chamar o restclient post ao retornar um serviceTypesReturnEntity corretamente no datasource',
      () async {
    when(
      () =>
          restclientPostMock.post(path: any(named: 'path'), data: data.toMap()),
    ).thenAnswer((_) async => RestClientResponse(
          data: servicesTypePayload,
          statucCode: 200,
        ));
    final sut =
        await createServiceTypeDatasource.call(createServiceTypeModel: data);
    expect(sut, serviceTypesReturnEntity);
    verify(
      () =>
          restclientPostMock.post(path: any(named: 'path'), data: data.toMap()),
    ).called(1);
  });
}
