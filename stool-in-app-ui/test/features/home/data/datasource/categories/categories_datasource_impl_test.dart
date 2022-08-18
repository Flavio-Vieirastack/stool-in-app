import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource_impl.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';

import '../../../../../mock/categories_mock.dart';
import '../../../../info/data/datasource/doubts/doubts_datasource_impl_test.dart';

class RestClientGetMock extends Mock implements RestClientGet {}

void main() {
  late RestclientGetMock restclientGetMock;
  late CategoriesDatasource categoriesDatasource;
  late List<CategoriesEntity> categoriesEntity;
  setUp(() {
    restclientGetMock = RestclientGetMock();
    categoriesDatasource =
        CategoriesDatasourceImpl(restClientGet: restclientGetMock);
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
    when(
      () => restclientGetMock.get(path: any(named: 'path')),
    ).thenThrow(CategoriesError(message: 'Erro ao buscar categorias, tente mais tarde'));
    final sut = categoriesDatasource.call;
    expect(() async => sut(), throwsException);

  });
}
