import 'dart:developer';

import 'package:stool_in_app_logic/features/auth/data/datasource/login/login_datasource.dart';
import 'package:stool_in_app_logic/features/auth/data/model/auth_model.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in_app_logic/features/auth/domain/repository/login/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _authDatasource;
  LoginRepositoryImpl({
    required LoginDatasource authDatasource,
  }) : _authDatasource = authDatasource;
  @override
  Future<Either<ApiAuthError, void>> apiLogin({
    required AuthEntity authEntity,
  }) async {
    try {
      final result = await _authDatasource.apiLogin(
        authModel: AuthModel.fromEntity(authEntity),
      );
      return Right(result);
    } on ApiAuthError catch (e, s) {
      log(
        'Erro ao realizar login para a api',
        error: e,
        stackTrace: s,
      );
      return Left(
        ApiAuthError(
          message: e.message,
        ),
      );
    } catch (e, s) {
      log(
        'Erro deconhecido ao realizar login para a api',
        error: e,
        stackTrace: s,
      );
      return Left(
        ApiAuthError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebaseLogin({
    required AuthEntity authEntity,
  }) async {
    try {
      final result = await _authDatasource.firebaseLogin(
        authModel: AuthModel.fromEntity(
          authEntity,
        ),
      );
      return Right(result); // TODO adicionar firebase aqui
    } on FirebaseAuthError catch (e, s) {
      log(
        'Erro ao fazer login no firebase',
        error: e,
        stackTrace: s,
      );
      return Left(
        FirebaseAuthError(
          message: e.message,
        ),
      );
    }
  }
}
