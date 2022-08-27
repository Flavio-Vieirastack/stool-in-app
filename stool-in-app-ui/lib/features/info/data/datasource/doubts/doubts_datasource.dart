import '../../../export/info_export.dart';

abstract class DoubtsDatasource {
  Future<List<InfoEntity>> getDoubts();
}
