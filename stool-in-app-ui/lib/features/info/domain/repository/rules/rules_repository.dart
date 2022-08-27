import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';

abstract class RulesRepository {
  Future<Either<InfoError, List<InfoEntity>>> getRules();
}