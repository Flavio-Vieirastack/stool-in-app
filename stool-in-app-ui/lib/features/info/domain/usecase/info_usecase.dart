import 'package:dartz/dartz.dart';

import '../../../../../exports/app_exports.dart';


abstract class InfoUsecase {
  Future<Either<InfoError, List<InfoEntity>>> getRules();
  Future<Either<InfoError, List<InfoEntity>>> getDoubts();
}