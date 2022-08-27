import '../../../export/info_export.dart';

abstract class RulesDatasource {
  Future<List<InfoEntity>> getRules();
}
