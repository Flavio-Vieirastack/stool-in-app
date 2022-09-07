import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../../../mock/rules_mock.dart';


class _RestclientGetMock extends Mock implements RestClientGet {}

class _SaveJsonCacheMock extends Mock implements SaveJsonInCacheDatasource {}

class _CachedUserDataHelperMock extends Mock implements CacheUserActionsHelper {
}

class _DecodedListCacheHelperMock extends Mock
    implements DecodedListCacheHelper {}

void main() {
  late _RestclientGetMock restclientGetMock;
  late RulesDatasource rulesDatasource;
  late _SaveJsonCacheMock saveJsonCacheMock;
  late List<InfoEntity> infoEntity;
  late List<Map<String, dynamic>> response;
  late _CachedUserDataHelperMock cachedUserDataHelperMock;
  late _DecodedListCacheHelperMock decodedListCacheHelperMock;

  setUp(() {
    cachedUserDataHelperMock = _CachedUserDataHelperMock();
    decodedListCacheHelperMock = _DecodedListCacheHelperMock();
    infoEntity = [InfoEntity(id: 1, title: 'title', body: 'body')];
    restclientGetMock = _RestclientGetMock();
    saveJsonCacheMock = _SaveJsonCacheMock();
    rulesDatasource = RulesDatasourceImpl(
        restClientGet: restclientGetMock,
        cacheUserActionsHelper: cachedUserDataHelperMock,
        decodedListCacheHelper: decodedListCacheHelperMock);
    response = [
      {"id": 1, "title": "title", "body": "body"}
    ];
  });
  test('Deve retornar uma lista de info entity', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetRulesData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetRulesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => rules,
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
    final sut = await rulesDatasource.getRules();
    expect(sut[0], infoEntity[0]);
  });
  test('Deve chamar o restclient get', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetRulesData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetRulesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => rules,
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
    final sut = await rulesDatasource.getRules();
    expect(sut[0], infoEntity[0]);
    verify(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).called(1);
  });
  test('Deve retornar um erro', () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    when(
      () => cachedUserDataHelperMock.getUserGetRulesData(),
    ).thenAnswer(
      (_) async => false,
    );
    when(
      () => cachedUserDataHelperMock.setUserGetRulesData(value: true),
    ).thenAnswer(
      (_) async => true,
    );
    when(
      () => decodedListCacheHelperMock.getDecodedList(key: any(named: 'key')),
    ).thenAnswer(
      (_) async => rules,
    );
    when(
      () => saveJsonCacheMock.saveJsonInCache(data: 'data', key: 'key'),
    ).thenAnswer((_) async => Future.value());
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenThrow(InfoError(message: 'message'));
    final sut = rulesDatasource.getRules;
    expect(() async => sut(), throwsException);
  });
}
