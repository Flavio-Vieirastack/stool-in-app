import 'package:dartz/dartz.dart';

import '../../entity/categories/categories_entity.dart';
import '../../error/categories/categories_error.dart';

abstract class CategoriesUsecase {
  Future<Either<CategoriesError, List<CategoriesEntity>>> call();
}