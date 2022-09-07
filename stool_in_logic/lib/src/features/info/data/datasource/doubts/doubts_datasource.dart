import '../../../../../exports/app_exports.dart';

abstract class DoubtsDatasource {
  Future<List<InfoEntity>> getDoubts();
}
