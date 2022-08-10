import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stool_in/features/auth/data/datasource/password_reset/password_reset_datasource.dart';
import 'package:stool_in/features/auth/data/model/auth_model.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in/features/auth/domain/repository/password_reset/password_reset_repository.dart';

class PasswordResetRepositoryImpl implements PasswordResetRepository {
  final PasswordResetDatasource _passwordResetDatasource;
  PasswordResetRepositoryImpl({
    required PasswordResetDatasource passwordResetDatasource,
  }) : _passwordResetDatasource = passwordResetDatasource;
  @override
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required AuthEntity authEntity,
  }) async {
    try {
      final result = await _passwordResetDatasource.apiPasswordReset(
        authModel: AuthModel.fromEntity(authEntity),
      );
      return Right(result);
    } on ApiAuthError catch (e, s) {
      log('Erro ao fazer reset de senha para a api', error: e, stackTrace: s);
      return Left(
        ApiAuthError(message: e.message),
      );
    } catch (e, s) {
      log(
        'Erro desconhecido ao fazer reset de senha para a api',
        error: e,
        stackTrace: s,
      );
      return left(
        ApiAuthError(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required AuthEntity authEntity,
  }) async {
    try {
      final result = await _passwordResetDatasource.firebasePasswordReset(
        authModel: AuthModel.fromEntity(authEntity),
      );
      return Right(result);
    } catch (e, s) {
      log(
        'Erro ao resetar senha no firebase',
        error: e,
        stackTrace: s,
      );
      return Left(
        FirebaseAuthError(
          message: 'Erro no servidor, tente mais tarde',
        ),
      );
    }
  }
}
