import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class _CategoriesDatasourceMock extends Mock implements CategoriesDatasource {}

class _CategoryEntityMock extends Mock implements CategoriesEntity {}

void main() {
  late _CategoriesDatasourceMock categoriesDatasourceMock;
  late List<_CategoryEntityMock> categoryEntityMock;
  late CategoriesRepository categoriesRepository;
  setUp(() {
    categoriesDatasourceMock = _CategoriesDatasourceMock();
    categoriesRepository = CategoriesRepositoryImpl(
        categoriesDatasource: categoriesDatasourceMock);
    categoryEntityMock = [_CategoryEntityMock()];
  });
  test('Deve retornar uma lista de categorias no repository', () async {
    when(
      () => categoriesDatasourceMock.call(),
    ).thenAnswer((_) async => categoryEntityMock);
    final sut = await categoriesRepository.call();
    expect(sut, Right(categoryEntityMock));
  });
  test('deve chamar o datasource das categorias', () async {
    when(
      () => categoriesDatasourceMock.call(),
    ).thenAnswer((_) async => categoryEntityMock);
    final sut = await categoriesRepository.call();
    expect(sut, Right(categoryEntityMock));
    verify(
      () => categoriesDatasourceMock.call(),
    ).called(1);
  });
  test('deve retornar um erro do tipo categories error no repository',
      () async {
    when(
      () => categoriesDatasourceMock.call(),
    ).thenThrow(
      CategoriesError(message: 'Erro ao buscar categorias, tente mais tarde'),
    );
    final sut = categoriesRepository.call;
    expect(
      await sut(),
      Left(
        CategoriesError(message: 'Erro ao buscar categorias, tente mais tarde'),
      ),
    );
  });
}
