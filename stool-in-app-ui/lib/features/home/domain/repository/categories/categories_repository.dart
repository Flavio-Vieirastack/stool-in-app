import 'package:dartz/dartz.dart';
import '../../../export/home_export.dart';

abstract class CategoriesRepository {
  Future<Either<CategoriesError, List<CategoriesEntity>>> call();
}
