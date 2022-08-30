import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';

class _RestclientGetMock extends Mock implements RestClientGet {}

class Teste extends Mock implements ServiceProviderModel {}

void main() {
  late _RestclientGetMock restclientGetMock;
  late SearchServiceProviderDatasource searchServiceProviderDatasource;
  late SearchServiceProviderModel searchServiceProviderModel;
  setUp(() {
    restclientGetMock = _RestclientGetMock();
    searchServiceProviderDatasource =
        SearchServiceProviderDatasourceImpl(restClientGet: restclientGetMock);
    searchServiceProviderModel =
        SearchServiceProviderModel(query: 'query', pages: 'pages');
  });
  test('Deve retornar uma lista de service provider entity ao fazer search',
      () async {
    when(
      () => restclientGetMock.get(
          path: any(
            named: 'path',
          ),
          queryParams: searchServiceProviderModel.toMap()),
    ).thenAnswer(
      (_) async => RestClientResponse(
        statucCode: 200,
      ),
    );
    final sut = await searchServiceProviderDatasource.searchServiceProviders(
      serviceProviderModel: searchServiceProviderModel,
    );
    expect(sut, isA<List<ServiceProviderEntity>>());
  });
  test(
      'Deve chamar o restclient get ao retornar uma lista de service provider entity ao fazer search',
      () async {
    when(
      () => restclientGetMock.get(
        path: any(
          named: 'path',
        ),
        queryParams: searchServiceProviderModel.toMap(),
      ),
    ).thenAnswer(
      (_) async => RestClientResponse(
        statucCode: 200,
      ),
    );
    final sut = await searchServiceProviderDatasource.searchServiceProviders(
      serviceProviderModel: searchServiceProviderModel,
    );
    expect(sut, isA<List<ServiceProviderEntity>>());
    verify(
      () => restclientGetMock.get(
        path: any(
          named: 'path',
        ),
        queryParams: searchServiceProviderModel.toMap(),
      ),
    ).called(1);
  });
  test(
      'Deve retornar um erro ao retornar uma lista de service provider entity ao fazer search',
      () async {
    when(
      () => restclientGetMock.get(
        path: any(
          named: 'path',
        ),
        queryParams: searchServiceProviderModel.toMap(),
      ),
    ).thenThrow(SearchServiceProviderError(
        message: 'Erro ao buscar prestadores de serviço, tente mais tarde'));
    final sut = searchServiceProviderDatasource.searchServiceProviders;
    expect(
      () async => sut(
        serviceProviderModel: searchServiceProviderModel,
      ),
      throwsException,
    );
  });
}
