import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';

import '../../entity/categories/categories_entity.dart';

abstract class CategoriesUsecase {
  Future<Either<CategoriesError, CategoriesEntity>> call();
}