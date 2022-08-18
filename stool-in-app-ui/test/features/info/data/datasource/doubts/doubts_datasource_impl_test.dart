import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/info/data/datasource/doubts/doubts_datasource.dart';
import 'package:stool_in/features/info/data/datasource/doubts/doubts_datasource_impl.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';

class RestclientGetMock extends Mock implements RestClientGet {}

void main() {
  late RestclientGetMock restclientGetMock;
  late DoubtsDatasource doubtsDatasource;
  late List<InfoEntity> infoEntity;
  late List<Map<String, dynamic>> response;
  setUp(() {
    restclientGetMock = RestclientGetMock();
    doubtsDatasource = DoubtsDatasourceImpl(restClientGet: restclientGetMock);
    infoEntity = [InfoEntity(id: 1, title: 'title', body: 'body')];
    response = [
      {"id": 1, "title": "title", "body": "body"}
    ];
  });
  test('Deve retornar uma lista de info entity para duvidas', () async {
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
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenThrow(InfoError(message: 'message'));
    final sut = doubtsDatasource.getDoubts;
    expect(() async => sut(), throwsException);
  });
}
