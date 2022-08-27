
import '../../../export/home_export.dart';

abstract class CategoriesDatasource {
  Future<List<CategoriesEntity>> call();
}
