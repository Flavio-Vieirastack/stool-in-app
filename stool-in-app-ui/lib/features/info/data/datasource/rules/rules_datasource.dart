import 'package:stool_in/features/info/domain/entity/info_entity.dart';

abstract class RulesDatasource {
  Future<List<InfoEntity>> getRules();
}
