import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../../../mock/service_provider_create_mock.dart';


class _RestclientPostImplMock extends Mock implements RestClientPost {}

class _RestClientPatchMock extends Mock implements RestClientPatch {}

void main() {
  late _RestclientPostImplMock restclientPostImplMock;
  late _RestClientPatchMock restClientPatchMock;
  late CreateServiceProviderDatasource createServiceProviderDatasource;
  late CreateAndUpdateServiceProviderModel data;
  late ServiceProviderReturnEntity serviceProviderReturnEntity;
  late UserDataModel userDataModel;
  setUp(() {
    restclientPostImplMock = _RestclientPostImplMock();
    restClientPatchMock = _RestClientPatchMock();
    createServiceProviderDatasource = CreateServiceProviderDatasourceImpl(
      restClientPost: restclientPostImplMock,
      restClientPatch: restClientPatchMock,
    );
    userDataModel = UserDataModel(
      serviceProviderId: 1,
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
      coins: 20,
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
    test('deve retornar uma inst??ncia de ServiceProviderReturnEntity',
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
    test('deve chamar o restclient post no createServiceProviderDatasource',
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
      verify(
        () => restclientPostImplMock.post(
            path: any(named: 'path'), data: data.toMap()),
      ).called(1);
    });
  });

  group('sendServiceProviderIdToUserData', () {
    test('Deve retornar void ao dar patch no id do service provider', () async {
      when(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: userDataModel.toMap()),
      ).thenAnswer(
          (_) async => RestClientResponse(data: null, statucCode: 200));
      final sut = createServiceProviderDatasource
          .sendServiceProviderIdToUserData(userDataModel: userDataModel);
      expect(sut, isA<Future<void>>());
    });
    test('Deve chamar o patch para atualizar o id do service provider', () async {
      when(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: userDataModel.toMap()),
      ).thenAnswer(
          (_) async => RestClientResponse(data: null, statucCode: 200));
      final sut = createServiceProviderDatasource
          .sendServiceProviderIdToUserData(userDataModel: userDataModel);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: userDataModel.toMap()),
      ).called(1);
    });
  });
}
