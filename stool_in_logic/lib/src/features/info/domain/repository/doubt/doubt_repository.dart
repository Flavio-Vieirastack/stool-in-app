import 'package:dartz/dartz.dart';

import '../../entity/info_entity.dart';
import '../../error/info_error.dart';

abstract class DoubtRepository {
  Future<Either<InfoError, List<InfoEntity>>> getDoubts();
}
