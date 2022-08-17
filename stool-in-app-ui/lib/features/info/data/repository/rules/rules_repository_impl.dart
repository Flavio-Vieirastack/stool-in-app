
import 'package:stool_in/features/info/domain/error/info_error.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/info/domain/repository/rules/rules_repository.dart';

class RulesRepositoryImpl implements RulesRepository {
  @override
  Future<Either<InfoError, List<InfoEntity>>> getRules() {
    // TODO: implement getRules
    throw UnimplementedError();
  }
  
}