import 'package:stool_in/features/home/domain/entity/categories/categories_entity.dart';

abstract class CategoriesDatasource {
  Future<List<CategoriesEntity>> call();
}
