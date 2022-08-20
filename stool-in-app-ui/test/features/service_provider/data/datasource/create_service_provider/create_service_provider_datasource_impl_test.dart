import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/service_provider/data/datasource/create_service_provider/create_service_provider_datasource.dart';
import 'package:stool_in/features/service_provider/data/datasource/create_service_provider/create_service_provider_datasource_impl.dart';
import 'package:stool_in/features/service_provider/data/model/create_service_provider/create_and_update_service_provider_model.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/service_provider_return_entity.dart';

import '../../../../../mock/service_provider_create_mock.dart';

class RestclientPostImplMock extends Mock implements RestClientPost {}

class RestClientPatchMock extends Mock implements RestClientPatch {}

void main() {
  late RestclientPostImplMock restclientPostImplMock;
  late RestClientPatchMock restClientPatchMock;
  late CreateServiceProviderDatasource createServiceProviderDatasource;
  late CreateAndUpdateServiceProviderModel data;
  late ServiceProviderReturnEntity serviceProviderReturnEntity;
  setUp(() {
    restclientPostImplMock = RestclientPostImplMock();
    restClientPatchMock = RestClientPatchMock();
    createServiceProviderDatasource = CreateServiceProviderDatasourceImpl(
      restClientPost: restclientPostImplMock,
      restClientPatch: restClientPatchMock,
    );
    data = CreateAndUpdateServiceProviderModel(
      userDescription:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      disponibleDays: "segunda a sexta",
      endDisponibleTime: DateTime.parse("2022-08-18T18:54:59.725Z"),
      initialDisponibleTime: DateTime.parse("2022-08-18T18:54:59.725Z"),
      status: "ATIVO",
      votes: 0,
    );
    serviceProviderReturnEntity = ServiceProviderReturnEntity(
      id: 1,
      userLoginId: 1,
      createdAt: DateTime.parse('2022-08-18T18:54:59.725Z'),
      disponibleDays: 'segunda a sexta',
      endDisponibleTime: DateTime.parse("2022-08-18T18:54:59.725Z"),
      initialDisponibleTime: DateTime.parse('2022-08-18T18:54:59.725Z'),
      status: "ATIVO",
      userDescription:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
      votes: 0,
    );
  });
  group('create service provider', () {
    test('deve retornar uma instância de ServiceProviderReturnEntity',
        () async {
      when(
        () => restclientPostImplMock.post(
            path: any(named: 'path'), data: data.toMap()),
      ).thenAnswer(
        (_) async => RestClientResponse(
          data: serviceProviderCreateMock,
          statucCode: 200,
        ),
      );
      final sut = await createServiceProviderDatasource.createServiceProvider(
          createAndUpdateServiceProviderModel: data);
      expect(sut, serviceProviderReturnEntity);
    });
  });
}
