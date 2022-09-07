import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';

abstract class CategoriesUsecase {
  Future<Either<CategoriesError, List<CategoriesEntity>>> call();
}