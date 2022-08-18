import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';

abstract class CategoriesRepository {
  Future<Either<CategoriesError, CategoriesEntity>> call();
}
