import 'package:stool_in/features/info/domain/entity/info_entity.dart';

abstract class DoubtsDatasource {
  Future<List<InfoEntity>> getDoubts();
}
