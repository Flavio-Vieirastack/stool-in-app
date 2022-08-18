import 'dart:developer';

import 'package:stool_in/features/home/data/datasource/categories/categories_datasource.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/repository/categories/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesDatasource _categoriesDatasource;
  CategoriesRepositoryImpl({
    required CategoriesDatasource categoriesDatasource,
  }) : _categoriesDatasource = categoriesDatasource;
  @override
  Future<Either<CategoriesError, List<CategoriesEntity>>> call() async {
    try {
      final result = await _categoriesDatasource.call();
      return Right(result);
    } on CategoriesError catch (e, s) {
      log('Erro ao buscar categorias no repopsitory impl',
          error: s, stackTrace: s);
      return Left(CategoriesError(
          message: 'Erro ao buscar categorias, tente mais tarde'));
    } catch (e, s) {
      log('Erro ao buscar categorias no repopsitory impl',
          error: s, stackTrace: s);
      return Left(
        CategoriesError(message: 'Erro de servidor, tente mais tarde'),
      );
    }
  }
}
