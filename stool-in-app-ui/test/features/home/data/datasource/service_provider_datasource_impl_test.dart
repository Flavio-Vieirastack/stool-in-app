import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/export/rest_client_export.dart';
import 'package:stool_in/features/home/export/home_export.dart';

import '../../../../mock/service_provider_payload.dart';
import '../../../../mock/service_provider_payload_diferent_location_data.dart';


class _ServiceProviderDataSourceMock extends Mock
    implements GetServiceProviderDatasource {}

class _ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {}

class _RestClientGetMock extends Mock implements RestClientGet {}

void main() {
  late _ServiceProviderDataSourceMock serviceProviderDataSourceMock;
  late _RestClientGetMock restClientGetMock;
  late List<_ServiceProviderEntityMock> serViceProviderEntity;
  late GetServiceProvidersParams params;
  late GetServiceProvidersParams paramsMeters;
  setUp(
    () {
      serviceProviderDataSourceMock = _ServiceProviderDataSourceMock();
      serViceProviderEntity = [_ServiceProviderEntityMock()];
      restClientGetMock = _RestClientGetMock();
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
