import 'package:stool_in/features/home/domain/error/categories/categories_error.dart';
import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/home/domain/repository/categories/categories_repository.dart';
import 'package:stool_in/features/home/domain/usecase/categories/categories_usecase.dart';

class CategoriesUsecaseImpl implements CategoriesUsecase {
  final CategoriesRepository _categoriesRepository;
  CategoriesUsecaseImpl({
    required CategoriesRepository categoriesRepository,
  }) : _categoriesRepository = categoriesRepository;
  @override
  Future<Either<CategoriesError, CategoriesEntity>> call() async {
    return await _categoriesRepository.call();
  }
}
