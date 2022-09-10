import 'dart:developer';

import 'package:stool_in_logic/src/features/home/data/datasource/user_unique/user_unique_datasource.dart';
import 'package:stool_in_logic/src/features/home/domain/error/user_unique/user_unique_error.dart';
import 'package:stool_in_logic/src/features/home/domain/entity/user_unique/user_unique_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in_logic/src/features/home/domain/repository/user_unique/user_unique_repository.dart';

class UserUniqueRepositoryImpl implements UserUniqueRepository {
  final UserUniqueDatasource _userUniqueDatasource;
  UserUniqueRepositoryImpl({
    required UserUniqueDatasource userUniqueDatasource,
  }) : _userUniqueDatasource = userUniqueDatasource;
  @override
  Future<Either<UserUniqueError, UserUniqueEntity>> call() async {
    try {
      final result = await _userUniqueDatasource.call();
      return Right(result);
    } on UserUniqueError catch (e, s) {
      log(
        'Erro ao pegar dados do user unique no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(UserUniqueError(error: e.error));
    } catch (e, s) {
      log(
        'Erro ao pegar dados do user unique no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        UserUniqueError(error: 'Erro interno, tente mais tarde'),
      );
    }
  }
}
