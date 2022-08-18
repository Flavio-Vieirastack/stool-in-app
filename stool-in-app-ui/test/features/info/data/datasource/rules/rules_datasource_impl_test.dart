import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/info/data/datasource/rules/rules_datasource.dart';
import 'package:stool_in/features/info/data/datasource/rules/rules_datasource_impl.dart';
import 'package:stool_in/features/info/data/model/info_model.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';

class RestclientGetMock extends Mock implements RestClientGet {}

void main() {
  late RestclientGetMock restclientGetMock;
  late RulesDatasource rulesDatasource;
  late List<InfoEntity> infoEntity;
  late List<Map<String, dynamic>> response;
  setUp(() {
    infoEntity = [InfoEntity(id: 1, title: 'title', body: 'body')];
    restclientGetMock = RestclientGetMock();
    rulesDatasource = RulesDatasourceImpl(restClientGet: restclientGetMock);
    response = [
      {"id": 1, "title": "title", "body": "body"}
    ];
  });
  test('Deve retornar uma lista de info entity', () async {
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
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenThrow(InfoError(message: 'message'));
    final sut = rulesDatasource.getRules;
    expect(() async => sut(), throwsException);
  });
}
