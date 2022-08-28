import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';

import '../../../../mock/service_provider_payload.dart';
import '../../../../mock/service_provider_payload_diferent_location_data.dart';

class _ServiceProviderDataSourceMock extends Mock
    implements GetServiceProviderDatasource {}

class _ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {
}

class _RestClientGetMock extends Mock implements RestClientGet {}

class _DistanceHelperCalculateMock extends Mock
    implements DistanceHelperCalculate {}

class _LocationMock extends Mock implements Location {}

class _GetServiceProviderParamnsMock extends Mock
    implements GetServiceProvidersParams {}

class _RestClientResponseMock extends Mock
    implements RestClientResponse<List<dynamic>> {}

class _ServiceProviderCalculateDistanceMock extends Mock
    implements ServiceProviderDatasourceCalculateDistance {}

void main() {
  late _ServiceProviderDataSourceMock serviceProviderDataSourceMock;
  late _RestClientGetMock restClientGetMock;
  late List<_ServiceProviderEntityMock> serViceProviderEntity;
  late GetServiceProvidersParams params;
  late GetServiceProvidersParams paramsMeters;
  late GetServiceProviderDatasource getServiceProviderDatasource;
  late _DistanceHelperCalculateMock distanceHelperCalculateMock;
  late _LocationMock locationMock;
  late _GetServiceProviderParamnsMock getServiceProviderParamnsMock;
  late _RestClientResponseMock responseMock;
  late _ServiceProviderCalculateDistanceMock
      serviceProviderCalculateDistanceMock;
  setUpAll(
    () {
      serviceProviderDataSourceMock = _ServiceProviderDataSourceMock();
      serViceProviderEntity = [_ServiceProviderEntityMock()];
      restClientGetMock = _RestClientGetMock();
      getServiceProviderParamnsMock = _GetServiceProviderParamnsMock();
      distanceHelperCalculateMock = _DistanceHelperCalculateMock();
      responseMock = _RestClientResponseMock();
      serviceProviderCalculateDistanceMock =
          _ServiceProviderCalculateDistanceMock();
      getServiceProviderDatasource = GetServiceProviderDatasourceImpl(
          restClientGet: restClientGetMock,
          serviceProviderDatasourceCalculateDistance:
              serviceProviderCalculateDistanceMock);
      locationMock = _LocationMock();
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
      registerFallbackValue(RestClientResponse<List<dynamic>>());
      registerFallbackValue(params);
    },
  );
  test('Deve retornar uma lista de service provider entity ao fazer get',
      () async {
    when(
      () => distanceHelperCalculateMock.caculateDistanceToInt(
        currentUserLocation: locationMock,
        serviceProviderLocation: locationMock,
      ),
    ).thenReturn(50);
    when(
      () => serviceProviderCalculateDistanceMock.calculateDistance(
          result: any(named: 'result'), params: any(named: 'params')),
    ).thenReturn(50);
    when(
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': params.pageQuantity,
      }),
    ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
    final sut =
        await getServiceProviderDatasource.call(providersParams: params);
    expect(sut, isA<List<ServiceProviderEntity>>());
  });
  test(
      'Deve chamar o restclient ao tentar retornar uma lista de service provider entity ao fazer get',
      () async {
    when(
      () => distanceHelperCalculateMock.caculateDistanceToInt(
        currentUserLocation: locationMock,
        serviceProviderLocation: locationMock,
      ),
    ).thenReturn(50);
    when(
      () => serviceProviderCalculateDistanceMock.calculateDistance(
          result: any(named: 'result'), params: any(named: 'params')),
    ).thenReturn(50);
    when(
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': params.pageQuantity,
      }),
    ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
    final sut =
        await getServiceProviderDatasource.call(providersParams: params);
    expect(sut, isA<List<ServiceProviderEntity>>());
    verify(
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': params.pageQuantity,
      }),
    ).called(2);
  });
  test(
      'Deve retornar um erro ao tentar retornar uma lista de service provider entity ao fazer get',
      () async {
    when(
      () => distanceHelperCalculateMock.caculateDistanceToInt(
        currentUserLocation: locationMock,
        serviceProviderLocation: locationMock,
      ),
    ).thenReturn(50);
    when(
      () => serviceProviderCalculateDistanceMock.calculateDistance(
          result: any(named: 'result'), params: any(named: 'params')),
    ).thenReturn(50);
    when(
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': params.pageQuantity,
      }),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut =
         getServiceProviderDatasource.call;
    expect(() async =>sut(providersParams: params), throwsA(isA<ServiceProviderError>()));
  });
}
