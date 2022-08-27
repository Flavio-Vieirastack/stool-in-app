import 'package:dartz/dartz.dart';
import '../../../export/info_export.dart';

abstract class RulesRepository {
  Future<Either<InfoError, List<InfoEntity>>> getRules();
}