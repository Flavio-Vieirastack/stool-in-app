import 'package:dartz/dartz.dart';
import '../../../export/home_export.dart';

abstract class CategoriesUsecase {
  Future<Either<CategoriesError, List<CategoriesEntity>>> call();
}