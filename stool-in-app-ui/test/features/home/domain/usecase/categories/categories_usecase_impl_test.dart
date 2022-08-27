import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';


class _CategoriesRepositoryMock extends Mock implements CategoriesRepository {}

class _CategoryEntityMock extends Mock implements CategoriesEntity {}

void main() {
  late _CategoriesRepositoryMock categoriesRepositoryMock;
  late List<_CategoryEntityMock> categoryEntityMock;
  late CategoriesUsecase categoriesUsecase;
  setUp(() {
    categoriesRepositoryMock = _CategoriesRepositoryMock();
    categoriesUsecase =
        CategoriesUsecaseImpl(categoriesRepository: categoriesRepositoryMock);
    categoryEntityMock = [_CategoryEntityMock()];
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
