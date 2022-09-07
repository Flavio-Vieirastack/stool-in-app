import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


import '../../../../../mock/doubts_mock.dart';


class _RestclientGetMock extends Mock implements RestClientGet {}

class _SaveJsonCacheMock extends Mock implements SaveJsonInCacheDatasource {}

class _CachedUserDataHelperMock extends Mock implements CacheUserActionsHelper {
}

class _DecodedListCacheHelperMock extends Mock
    implements DecodedListCacheHelper {}

void main() {
  late _RestclientGetMock restclientGetMock;
  late DoubtsDatasource doubtsDatasource;
  late _SaveJsonCacheMock saveJsonCacheMock;
  late List<InfoEntity> infoEntity;
  late List<Map<String, dynamic>> response;
  late _CachedUserDataHelperMock cachedUserDataHelperMock;
  late _DecodedListCacheHelperMock decodedListCacheHelperMock;
  setUp(() {
    cachedUserDataHelperMock = _CachedUserDataHelperMock();
    decodedListCacheHelperMock = _DecodedListCacheHelperMock();
    saveJsonCacheMock = _SaveJsonCacheMock();
    restclientGetMock = _RestclientGetMock();
    doubtsDatasource = DoubtsDatasourceImpl(
      restClientGet: restclientGetMock,
      cacheUserActionsHelper: cachedUserDataHelperMock,
      decodedListCacheHelper: decodedListCacheHelperMock,
    );
    infoEntity = [InfoEntity(id: 1, title: 'title', body: 'body')];
    response = [
      {"id": 1, "title": "title", "body": "body"}
    ];
  });
  test('Deve retornar uma lista de info entity para duvidas', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetDoubtsData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetDoubtsData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => doubts,
    );
    when(
      () => saveJsonCacheMock.saveJsonInCache(data: 'data', key: 'key'),
    ).thenAnswer((_) async => Future.value());
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenAnswer((_) async => RestClientResponse(
          data: response,
          statucCode: 200,
        ));
    final sut = await doubtsDatasource.getDoubts();
    expect(sut, infoEntity);
  });
  test('Deve chamar o restclient get corretamente para duvidas', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetDoubtsData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetDoubtsData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => doubts,
    );
    when(
      () => saveJsonCacheMock.saveJsonInCache(data: 'data', key: 'key'),
    ).thenAnswer((_) async => Future.value());
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenAnswer((_) async => RestClientResponse(
          data: response,
          statucCode: 200,
        ));
    final sut = await doubtsDatasource.getDoubts();
    expect(sut, infoEntity);
    verify(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).called(1);
  });
  test('Deve retornar um erro corretamente para duvidas', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetDoubtsData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetDoubtsData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => doubts,
    );
    when(
      () => cachedUserDataHelperMock.getUserGetDoubtsData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => doubts,
    );
    when(
      () => saveJsonCacheMock.saveJsonInCache(data: 'data', key: 'key'),
    ).thenAnswer((_) async => Future.value());
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenThrow(InfoError(message: 'message'));
    final sut = doubtsDatasource.getDoubts;
    expect(() async => sut(), throwsException);
  });
}
