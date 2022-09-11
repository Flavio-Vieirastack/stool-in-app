import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class _RestClientGetMock extends Mock implements RestClientGet {}

class _DistanceHelperCalculateMock extends Mock
    implements DistanceHelperCalculate {}

class _LocationMock extends Mock implements Location {}

class EntityMock extends Mock implements ServiceProviderModel {}

class _ServiceProviderCalculateDistanceMock extends Mock
    implements ServiceProviderDatasourceCalculateDistance {}

void main() {
  late _RestClientGetMock restClientGetMock;
  late GetServiceProvidersParams params;
  late GetServiceProviderDatasource getServiceProviderDatasource;
  late _DistanceHelperCalculateMock distanceHelperCalculateMock;
  late _LocationMock locationMock;
  late List<EntityMock> entityMock;
  late _ServiceProviderCalculateDistanceMock
      serviceProviderCalculateDistanceMock;
  setUpAll(
    () {
      restClientGetMock = _RestClientGetMock();
      entityMock = [EntityMock()];
      distanceHelperCalculateMock = _DistanceHelperCalculateMock();
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
    ).thenReturn(entityMock);
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
    ).thenReturn(entityMock);
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
    ).thenReturn(entityMock);
    when(
      () => restClientGetMock.get<List>(path: any(named: 'path'), queryParams: {
        'pages': params.pageQuantity,
      }),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut = getServiceProviderDatasource.call;
    expect(() async => sut(providersParams: params),
        throwsA(isA<ServiceProviderError>()));
  });
}
