import 'package:dartz/dartz.dart';
import '../../../export/info_export.dart';

abstract class DoubtRepository {
  Future<Either<InfoError, List<InfoEntity>>> getDoubts();
}
