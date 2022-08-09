import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stool_in_app_ui/core/rest_client/error/rest_client_exception.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/sign_in/sign_in_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/model/auth_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/sign_in/sign_in_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDatasource _signInDatasource;
  SignInRepositoryImpl({required SignInDatasource signInDatasource})
      : _signInDatasource = signInDatasource;
  @override
  Future<Either<ApiAuthError, void>> apiSignIn({
    required AuthEntity authEntity,
  }) async {
    try {
      final result = await _signInDatasource.apiSignIn(
        authModel: AuthModel.fromEntity(authEntity),
      );
      return Right(result);
    } on ApiAuthError catch (e, s) {
      log(
        'Erro ao fazer cadastro na api',
        error: e,
        stackTrace: s,
      );
      return Left(
        ApiAuthError(
          message: e.message,
        ),
      );
    } on RestClientException catch (e, s) {
      log(
        'Erro desconhecido ao fazer cadastro na api',
        error: e,
        stackTrace: s,
      );
      if (e.statusCode == 500) {
        return Left(
          ApiAuthError(
            message: 'Usuário ja existente',
          ),
        );
      }
      return Left(
          ApiAuthError(
            message: 'Erro desconhecido, tente novamente mais tarde',
          ),
        );
    }
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebaseSignIn({
    required AuthEntity authEntity,
  }) async {
    try {
      final result = await _signInDatasource.firebaseSignIn(
          authModel: AuthModel.fromEntity(authEntity));
      return Right(result);
    } catch (e, s) {
      // TODO adicionar firebase
      log(
        'Erro desconhecido ao fazer cadastro na api',
        error: e,
        stackTrace: s,
      );
      return Left(
        FirebaseAuthError(
          message: e.toString(),
        ),
      );
    }
  }
}
