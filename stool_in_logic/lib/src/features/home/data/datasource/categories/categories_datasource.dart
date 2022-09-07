
import '../../../../../exports/app_exports.dart';

abstract class CategoriesDatasource {
  Future<List<CategoriesEntity>> call();
}
