import 'package:dartz/dartz.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';

abstract class DoubtRepository {
  Future<Either<InfoError, List<InfoEntity>>> getDoubts();
}