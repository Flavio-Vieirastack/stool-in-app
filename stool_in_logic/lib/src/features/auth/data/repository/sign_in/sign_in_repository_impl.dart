import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../exports/app_exports.dart';

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
    } on FirebaseAuthException catch (e, s) {
      log(
        'Erro desconhecido ao fazer cadastro no firebase',
        error: e,
        stackTrace: s,
      );
      if (e.code == 'weak-password') {
        return Left(
          FirebaseAuthError(
            message: 'Senha muito fraca',
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        return Left(
          FirebaseAuthError(
            message: 'Email já existe',
          ),
        );
      }
      return Left(
        FirebaseAuthError(message: 'Erro desconhecido, tente mais tarde'),
      );
    }
  }
}
