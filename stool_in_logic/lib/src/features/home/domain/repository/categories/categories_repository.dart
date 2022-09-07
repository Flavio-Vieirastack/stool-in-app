import 'package:dartz/dartz.dart';

import '../../entity/categories/categories_entity.dart';
import '../../error/categories/categories_error.dart';

abstract class CategoriesRepository {
  Future<Either<CategoriesError, List<CategoriesEntity>>> call();
}
