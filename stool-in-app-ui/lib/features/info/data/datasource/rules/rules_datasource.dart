import '../../../../../exports/app_exports.dart';

abstract class RulesDatasource {
  Future<List<InfoEntity>> getRules();
}
