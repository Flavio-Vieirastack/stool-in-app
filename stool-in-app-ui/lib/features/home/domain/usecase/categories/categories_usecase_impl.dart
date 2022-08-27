import '../../../export/home_export.dart';
import 'package:dartz/dartz.dart';


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
