import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../domain/entity/categories/categories_entity.dart';
import '../../../domain/error/categories/categories_error.dart';
import '../../../domain/repository/categories/categories_repository.dart';
import '../../datasource/categories/categories_datasource.dart';



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
