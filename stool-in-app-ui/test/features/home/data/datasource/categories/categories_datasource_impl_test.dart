import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stool_in/core/cache/helpers/decoded_list_cache_helper.dart';
import 'package:stool_in/core/cache/helpers/user_actions_helper/cache_user_actions_helper.dart';
import 'package:stool_in/core/cache/save_json_in_cache_datasource.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource_impl.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';

import '../../../../../mock/categories_mock.dart';

class _DecodedListCacheHelperMock extends Mock
    implements DecodedListCacheHelper {}

class _RestClientGetMock extends Mock implements RestClientGet {}

class _CachedUserDataHelperMock extends Mock implements CacheUserActionsHelper {
}

class _SaveJsonCacheMock extends Mock implements SaveJsonInCacheDatasource {}

void main() {
  late _RestClientGetMock restclientGetMock;
  late CategoriesDatasource categoriesDatasource;
  late List<CategoriesEntity> categoriesEntity;
  late _SaveJsonCacheMock saveJsonCacheMock;
  late _CachedUserDataHelperMock cachedUserDataHelperMock;
  late _DecodedListCacheHelperMock decodedListCacheHelperMock;
  setUp(() {
    cachedUserDataHelperMock = _CachedUserDataHelperMock();
    decodedListCacheHelperMock = _DecodedListCacheHelperMock();
    saveJsonCacheMock = _SaveJsonCacheMock();
    restclientGetMock = _RestClientGetMock();
    categoriesDatasource = CategoriesDatasourceImpl(
        restClientGet: restclientGetMock,
        cacheUserActionsHelper: cachedUserDataHelperMock,
        decodedListCacheHelper: decodedListCacheHelperMock);
    categoriesEntity = [
      CategoriesEntity(
        id: 1,
        categoryName: 'Pintores',
        searchQuery: 'Seach',
        lottieUrl:
            'https://assets4.lottiefiles.com/packages/lf20_xbwgvxer.json',
      ),
    ];
  });
  test('Deve retornar uma lista de categorias no datasource', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetCategoriesData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetCategoriesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => categories,
    );
    when(
      () => saveJsonCacheMock.saveJsonInCache(data: 'data2', key: 'key2'),
    ).thenAnswer((_) async => categories);
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenAnswer((_) async => RestClientResponse(
          data: categories,
          statucCode: 200,
        ));
    final sut = await categoriesDatasource.call();
    expect(sut, categoriesEntity);
  });
  test('Deve chamar o rest client get corretamente para categorias', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetCategoriesData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetCategoriesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => categories,
    );
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenAnswer((_) async => RestClientResponse(
          data: categories,
          statucCode: 200,
        ));
    final sut = await categoriesDatasource.call();
    expect(sut, categoriesEntity);
    verify(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).called(1);
  });
  test('Deve retornar um erro no datasource impl', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetCategoriesData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetCategoriesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => categories,
    );
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenThrow(CategoriesError(
        message: 'Erro ao buscar categorias, tente mais tarde'));
    final sut = categoriesDatasource.call;
    expect(() async => sut(), throwsException);
  });
}
