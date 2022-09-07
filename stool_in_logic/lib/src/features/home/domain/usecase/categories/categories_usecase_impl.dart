import 'package:dartz/dartz.dart';

import '../../entity/categories/categories_entity.dart';
import '../../error/categories/categories_error.dart';
import '../../repository/categories/categories_repository.dart';
import 'categories_usecase.dart';


class CategoriesUsecaseImpl implements CategoriesUsecase {
  final CategoriesRepository _categoriesRepository;
  CategoriesUsecaseImpl({
    required CategoriesRepository categoriesRepository,
  }) : _categoriesRepository = categoriesRepository;
  @override
  Future<Either<CategoriesError, List<CategoriesEntity>>> call() async {
    return await _categoriesRepository.call();
  }
}
