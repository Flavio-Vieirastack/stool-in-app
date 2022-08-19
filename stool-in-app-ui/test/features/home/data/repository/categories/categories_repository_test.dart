import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/home/data/datasource/categories/categories_datasource.dart';
import 'package:stool_in/features/home/data/repository/categories/categories_repository_impl.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';
import 'package:stool_in/features/home/domain/repository/categories/categories_repository.dart';

class CategoriesDatasourceMock extends Mock implements CategoriesDatasource {}

class CategoryEntityMock extends Mock implements CategoriesEntity {}

void main() {
  late CategoriesDatasourceMock categoriesDatasourceMock;
  late List<CategoryEntityMock> categoryEntityMock;
  late CategoriesRepository categoriesRepository;
  setUp(() {
    categoriesDatasourceMock = CategoriesDatasourceMock();
    categoriesRepository = CategoriesRepositoryImpl(
        categoriesDatasource: categoriesDatasourceMock);
    categoryEntityMock = [CategoryEntityMock()];
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