import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entity/auth_entity.dart';
import '../../../domain/entity/user_token_entity.dart';
import '../../../domain/error/api_auth_error.dart';
import '../../../domain/error/firebase_auth_error.dart';
import '../../../domain/repository/login/login_repository.dart';
import '../../datasource/login/login_datasource.dart';
import '../../model/auth_model.dart';



class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _loginDatasource;
  LoginRepositoryImpl({
    required LoginDatasource loginDatasource,
  }) : _loginDatasource = loginDatasource;
  @override
  Future<Either<ApiAuthError, UserTokenEntity>> apiLogin({
    required AuthEntity authEntity,
  }) async {
    try {
      final result = await _loginDatasource.apiLogin(
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
          message: 'Erro desconhecido, tente mais tarde',
        ),
      );
    }
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebaseLogin({
    required AuthEntity authEntity,
  }) async {
    try {
      final result = await _loginDatasource.firebaseLogin(
        authModel: AuthModel.fromEntity(
          authEntity,
        ),
      );
      return Right(result);
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
    } on FirebaseAuthException catch (e, s) {
      log(
        'Erro ao fazer login no firebase',
        error: e,
        stackTrace: s,
      );
      if (e.code == 'user-not-found') {
        return Left(
          FirebaseAuthError(
            message: 'Usu??rio n??o encontrado',
          ),
        );
      } else if (e.code == 'wrong-password') {
        return Left(
          FirebaseAuthError(
            message: 'Senha n??o confere',
          ),
        );
      }
      return Left(
        FirebaseAuthError(
          message: 'Erro desconhecido, tente mais tarde',
        ),
      );
    }
  }
}
