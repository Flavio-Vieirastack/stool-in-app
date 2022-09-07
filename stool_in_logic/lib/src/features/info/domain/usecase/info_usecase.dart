import 'package:dartz/dartz.dart';

import '../entity/info_entity.dart';
import '../error/info_error.dart';



abstract class InfoUsecase {
  Future<Either<InfoError, List<InfoEntity>>> getRules();
  Future<Either<InfoError, List<InfoEntity>>> getDoubts();
}