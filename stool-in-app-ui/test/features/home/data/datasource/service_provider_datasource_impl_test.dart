import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class _RestClientGetMock extends Mock implements RestClientGet {}

class _DistanceHelperCalculateMock extends Mock
    implements DistanceHelperCalculate {}

class _LocationMock extends Mock implements Location {}

void main() {
  late _RestClientGetMock restClientGetMock;
  late GetServiceProvidersParams params;
  late GetServiceProviderDatasource getServiceProviderDatasource;
  late _DistanceHelperCalculateMock distanceHelperCalculateMock;
  late _LocationMock locationMock;

  setUpAll(
    () {
      restClientGetMock = _RestClientGetMock();
      distanceHelperCalculateMock = _DistanceHelperCalculateMock();

      getServiceProviderDatasource = GetServiceProviderDatasourceImpl(
        restClientGet: restClientGetMock,
      );
      locationMock = _LocationMock();
      params = GetServiceProvidersParams(
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
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': 5,
      }),
    ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
    final sut = await getServiceProviderDatasource.call(pageQuantity: 5);
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
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': 5,
      }),
    ).thenAnswer((_) async => RestClientResponse(statucCode: 200));
    final sut = await getServiceProviderDatasource.call(pageQuantity: 5);
    expect(sut, isA<List<ServiceProviderEntity>>());
    verify(
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': 5,
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
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': 5,
      }),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut = getServiceProviderDatasource.call;
    expect(
        () async => sut(pageQuantity: 5), throwsA(isA<ServiceProviderError>()));
  });
}
