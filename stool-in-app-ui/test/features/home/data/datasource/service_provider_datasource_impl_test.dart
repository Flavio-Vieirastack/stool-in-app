import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in_app_ui/core/rest_client/rest_client_response.dart';
import 'package:stool_in_app_ui/features/home/data/datasource/service_provider_datasource.dart';
import 'package:stool_in_app_ui/features/home/data/model/service_provider_model.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/get_service_providers_params.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/error/service_provider_error.dart';

import '../../../../mock/service_provider_payload.dart';
import '../../../../mock/service_provider_payload_diferent_location_data.dart';

class ServiceProviderDataSourceMock extends Mock
    implements ServiceProviderDatasource {}

class ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {}

class RestClientGetMock extends Mock implements RestClientGet {}

void main() {
  late ServiceProviderDataSourceMock serviceProviderDataSourceMock;
  late RestClientGetMock restClientGetMock;
  late List<ServiceProviderEntityMock> serViceProviderEntity;
  late GetServiceProvidersParams params;
  late GetServiceProvidersParams paramsMeters;
  setUp(
    () {
      serviceProviderDataSourceMock = ServiceProviderDataSourceMock();
      serViceProviderEntity = [ServiceProviderEntityMock()];
      restClientGetMock = RestClientGetMock();
      params = GetServiceProvidersParams(
        pageQuantity: 5,
        currentUserLocationLatitude: -7.231148136572121,
        currentUserLocationLongitude: -39.40686133322621,
      );
      paramsMeters = GetServiceProvidersParams(
        pageQuantity: 5,
        currentUserLocationLatitude: -7.231148136572121,
        currentUserLocationLongitude: -39.40686133322621,
      );
    },
  );
  test('Deve retornar uma entidade corretamente', () async {
    when(
      () => serviceProviderDataSourceMock.call(providersParams: params),
    ).thenAnswer((_) async => serViceProviderEntity);
    final sut =
        await serviceProviderDataSourceMock.call(providersParams: params);
    expect(sut, serViceProviderEntity);
  });
  test('Deve retornar um erro corretamente', () async {
    when(
      () => serviceProviderDataSourceMock.call(providersParams: params),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut = serviceProviderDataSourceMock.call;
    expect(() async => sut(providersParams: params), throwsException);
  });

  test('Deve retornar a distância correta baseado no payload em km', () async {
    final payload = serviceProviderPayload;
    when(
      () => restClientGetMock.get<List>(path: 'path'),
    ).thenAnswer((_) async => RestClientResponse<List>(data: payload));
    final result = await restClientGetMock.get<List>(path: 'path');
    when(
      () => serviceProviderDataSourceMock.calculateDistance(
        result: result,
        params: params,
      ),
    ).thenAnswer((_) => 1);
    final sut = serviceProviderDataSourceMock.calculateDistance(
        result: result, params: params);
    expect(sut, 1);
  });
  test('Deve retornar a distância correta baseado no payload em Metros negativos', () async {
    final payload = serviceProviderPayloadWithDiferentLocationInMeters;
    when(
      () => restClientGetMock.get<List>(path: 'path'),
    ).thenAnswer((_) async => RestClientResponse<List>(data: payload));
    final result = await restClientGetMock.get<List>(path: 'path');
    when(
      () => serviceProviderDataSourceMock.calculateDistance(
        result: result,
        params: paramsMeters,
      ),
    ).thenAnswer((_) => -435);
    final sut = serviceProviderDataSourceMock.calculateDistance(
        result: result, params: params);
    expect(sut, -435);
  });
}
