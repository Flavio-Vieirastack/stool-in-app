import 'dart:developer';


import 'package:dartz/dartz.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/login/login_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/model/auth_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/login/login_repository.dart';


import '../../../domain/entity/user_token_entity.dart';

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
      final result = await _loginDatasource.firebaseLogin(
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