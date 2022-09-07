import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../../../mock/service_types_return_enty_payload_mock.dart';


class _RestClientGetMock extends Mock implements RestClientGet {}

class _SaveJsonCacheMock extends Mock implements SaveJsonInCacheDatasource {}

class _CachedUserDataHelperMock extends Mock implements CacheUserActionsHelper {
}

class _DecodedListCacheHelperMock extends Mock
    implements DecodedListCacheHelper {}

void main() {
  late _RestClientGetMock restClientGetMock;
  late GetUserServiceTypesDatasource getUserServiceTypesDatasource;
  late CreateServiceTypesEntity createServiceTypeEntity;
  late List<ServiceTypesReturnEntity> serviceTypesReturnEntity;
  late _SaveJsonCacheMock saveJsonCacheMock;
  late _CachedUserDataHelperMock cachedUserDataHelperMock;
  late _DecodedListCacheHelperMock decodedListCacheHelperMock;
  late WidgetsBinding binding;
  setUp(() {
    binding = WidgetsFlutterBinding.ensureInitialized();
    restClientGetMock = _RestClientGetMock();
    serviceTypesReturnEntity = [
      ServiceTypesReturnEntity(
        serviceProviderId: 1,
        serviceTypeId: 2,
        estimatedHours: 1,
        price: 50,
        serviceName: 'Diferente2',
      ),
    ];
    saveJsonCacheMock = _SaveJsonCacheMock();
    createServiceTypeEntity = CreateServiceTypesEntity(serviceProviderId: 1);
    cachedUserDataHelperMock = _CachedUserDataHelperMock();
    decodedListCacheHelperMock = _DecodedListCacheHelperMock();
    getUserServiceTypesDatasource = GetUserServiceTypesDatasourceImpl(
      restClientGet: restClientGetMock,
      cacheUserActionsHelper: cachedUserDataHelperMock,
      decodedListCacheHelper: decodedListCacheHelperMock,
    );
  });
  test('Deve retornar uma lista de ServiceTypesReturnEntity', () async {
    binding;
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetUserServiceTypesData(),
    ).thenAnswer(
      (_) async => false,
    );

    when(
      () =>
          cachedUserDataHelperMock.setUserGetUserServiceTypesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(
          key: CacheDatasourceKeys.userServiceTypeCryptCacheKey),
    ).thenAnswer(
      (_) async => [servicesTypePayload],
    );
    when(
      () => saveJsonCacheMock.saveJsonInCache(
        data: 'data',
        key: 'key',
      ),
    ).thenAnswer((_) async => Future.value());
    when(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).thenAnswer(
      (_) async => RestClientResponse(
        data: servicesTypePayloadList,
        statucCode: 200,
      ),
    );

    final sut = await getUserServiceTypesDatasource.getUserServicesTypes(
        serviceProviderId: createServiceTypeEntity);
    expect(sut[0], serviceTypesReturnEntity[0]);
  });
  test(
      'Deve chamar o rest client ao retornar uma lista de ServiceTypesReturnEntity',
      () async {
    binding;
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetUserServiceTypesData(),
    ).thenAnswer(
      (_) async => false,
    );

    when(
      () =>
          cachedUserDataHelperMock.setUserGetUserServiceTypesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(
          key: CacheDatasourceKeys.userServiceTypeCryptCacheKey),
    ).thenAnswer(
      (_) async => [servicesTypePayload],
    );
    when(
      () => saveJsonCacheMock.saveJsonInCache(
        data: 'data',
        key: 'key',
      ),
    ).thenAnswer((_) async => Future.value());
    when(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).thenAnswer(
      (_) async => RestClientResponse(
        data: servicesTypePayloadList,
        statucCode: 200,
      ),
    );

    final sut = await getUserServiceTypesDatasource.getUserServicesTypes(
        serviceProviderId: createServiceTypeEntity);
    expect(sut[0], serviceTypesReturnEntity[0]);
    verify(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).called(1);
  });
  test('Deve retornar um erro ao tentar buscar user sevice types', () async {
    binding;
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetUserServiceTypesData(),
    ).thenAnswer(
      (_) async => false,
    );

    when(
      () =>
          cachedUserDataHelperMock.setUserGetUserServiceTypesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(
          key: CacheDatasourceKeys.userServiceTypeCryptCacheKey),
    ).thenAnswer(
      (_) async => [servicesTypePayload],
    );
    when(
      () => saveJsonCacheMock.saveJsonInCache(
        data: 'data',
        key: 'key',
      ),
    ).thenAnswer((_) async => Future.value());
    when(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).thenThrow(
      GetUserServiceTypesError(message: 'message'),
    );

    final sut = getUserServiceTypesDatasource.getUserServicesTypes;
    expect(
      () async => sut(serviceProviderId: createServiceTypeEntity),
      throwsA(isA<GetUserServiceTypesError>()),
    );
  });
}
