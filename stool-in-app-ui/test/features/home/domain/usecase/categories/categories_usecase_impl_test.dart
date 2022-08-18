import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';
import 'package:stool_in/features/home/domain/repository/categories/categories_repository.dart';
import 'package:stool_in/features/home/domain/usecase/categories/categories_usecase.dart';
import 'package:stool_in/features/home/domain/usecase/categories/categories_usecase_impl.dart';

class CategoriesRepositoryMock extends Mock implements CategoriesRepository {}

class CategoryEntityMock extends Mock implements CategoriesEntity {}

void main() {
  late CategoriesRepositoryMock categoriesRepositoryMock;
  late List<CategoryEntityMock> categoryEntityMock;
  late CategoriesUsecase categoriesUsecase;
  setUp(() {
    categoriesRepositoryMock = CategoriesRepositoryMock();
    categoriesUsecase =
        CategoriesUsecaseImpl(categoriesRepository: categoriesRepositoryMock);
    categoryEntityMock = [CategoryEntityMock()];
  });
  test('Deve retornar uma lista de categorias corretamente', () async {
    when(
      () => categoriesRepositoryMock.call(),
    ).thenAnswer((_) async => Right(categoryEntityMock));
    final sut = await categoriesUsecase.call();

    expect(sut, Right(categoryEntityMock));
  });
  test('Deve chamar o repository corretamente', () async {
    when(
      () => categoriesRepositoryMock.call(),
    ).thenAnswer((_) async => Right(categoryEntityMock));
    final sut = await categoriesUsecase.call();

    expect(sut, Right(categoryEntityMock));
    verify(
      () => categoriesRepositoryMock.call(),
    ).called(1);
  });
  test('Deve retornar um erro do tipo categories error', () async {
    when(
      () => categoriesRepositoryMock.call(),
    ).thenAnswer((_) async => Left(CategoriesError(message: 'message')));
    final sut = await categoriesUsecase.call();

    expect(sut, Left(CategoriesError(message: 'message')));
  });
}
