import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';

abstract class CategoriesRepository {
  Future<Either<CategoriesError, List<CategoriesEntity>>> call();
}
