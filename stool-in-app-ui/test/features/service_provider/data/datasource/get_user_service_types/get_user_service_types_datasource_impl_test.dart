import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stool_in/core/cache/helpers/decoded_list_cache_helper.dart';
import 'package:stool_in/core/cache/helpers/user_actions_helper/cache_user_actions_helper.dart';
import 'package:stool_in/core/cache/keys/cache_datasource_keys.dart';
import 'package:stool_in/core/cache/save_json_in_cache_datasource.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/service_provider/data/datasource/get_user_service_types/get_user_service_types_datasource.dart';
import 'package:stool_in/features/service_provider/data/datasource/get_user_service_types/get_user_service_types_datasource_impl.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/create_service_types_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_types/service_types_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/get_user_service_types_error.dart';

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

    final sut = await getUserServiceTypesDatasource.call(
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

    final sut = await getUserServiceTypesDatasource.call(
        serviceProviderId: createServiceTypeEntity);
    expect(sut[0], serviceTypesReturnEntity[0]);
    verify(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).called(1);
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

    final sut = await getUserServiceTypesDatasource.call(
        serviceProviderId: createServiceTypeEntity);
    expect(sut[0], serviceTypesReturnEntity[0]);
    verify(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).called(1);
  });

}
