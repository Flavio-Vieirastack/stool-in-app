import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';

abstract class DoubtRepository {
  Future<Either<InfoError, List<InfoEntity>>> getDoubts();
}
