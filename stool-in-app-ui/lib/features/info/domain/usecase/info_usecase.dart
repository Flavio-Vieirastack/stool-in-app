import 'package:dartz/dartz.dart';

import '../../export/info_export.dart';


abstract class InfoUsecase {
  Future<Either<InfoError, List<InfoEntity>>> getRules();
  Future<Either<InfoError, List<InfoEntity>>> getDoubts();
}