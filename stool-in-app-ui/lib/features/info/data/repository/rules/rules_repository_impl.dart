import 'dart:developer';

import 'package:stool_in/features/info/data/datasource/rules/rules_datasource.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/features/info/domain/repository/rules/rules_repository.dart';

class RulesRepositoryImpl implements RulesRepository {
  final RulesDatasource _rulesDatasource;
  RulesRepositoryImpl({
    required RulesDatasource rulesDatasource,
  }) : _rulesDatasource = rulesDatasource;
  @override
  Future<Either<InfoError, List<InfoEntity>>> getRules() async {
    try {
      final result = await _rulesDatasource.getRules();
      return Right(result);
    } on InfoError catch (e, s) {
      log('Erro no rules repository', error: e, stackTrace: s);
      return Left(
        InfoError(message: e.message),
      );
    } catch (e,s) {
      log('Erro desconhecido no rules repository', error: e, stackTrace: s);
      return Left(
        InfoError(message: 'Erro ao buscar dados das regras, tente mais tarde'),
      );
    }
  }
}
