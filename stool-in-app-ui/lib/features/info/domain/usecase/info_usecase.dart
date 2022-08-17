import 'package:dartz/dartz.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';

abstract class InfoUsecase {
  Future<Either<InfoError, void>> getRules();
  Future<Either<InfoError, void>> getDoubts();
}