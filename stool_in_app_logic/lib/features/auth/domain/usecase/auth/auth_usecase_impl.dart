import 'package:dartz/dartz.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/repository/login/login_repository.dart';
import 'package:stool_in_app_logic/features/auth/domain/repository/password_reset/password_reset_repository.dart';
import 'package:stool_in_app_logic/features/auth/domain/repository/sign_in/sign_in_repository.dart';

import 'auth_use_case.dart';

class AuthUsecaseImpl implements AuthUseCase {
  final LoginRepository _authRepository;
  final SignInRepository _signInRepository;
  final PasswordResetRepository _passwordResetRepository;
  AuthUsecaseImpl({
    required LoginRepository authRepository,
    required SignInRepository signInRepository,
    required PasswordResetRepository passwordResetRepository,
  })  : _authRepository = authRepository,
        _passwordResetRepository = passwordResetRepository,
        _signInRepository = signInRepository;

  @override
  Future<Either<ApiAuthError, void>> apiLogin({
    required AuthEntity authEntity,
  }) {
    return _authRepository.apiLogin(authEntity: authEntity);
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebaseLogin({
    required AuthEntity authEntity,
  }) {
    return _authRepository.firebaseLogin(authEntity: authEntity);
  }

  @override
  Future<Either<ApiAuthError, void>> apiSignIn({
    required AuthEntity authEntity,
  }) {
    return _signInRepository.apiSignIn(authEntity: authEntity);
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebaseSignIn({
    required AuthEntity authEntity,
  }) {
    return _signInRepository.firebaseSignIn(authEntity: authEntity);
  }

  @override
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required AuthEntity authEntity,
  }) {
    return _passwordResetRepository.apiPasswordReset(
        authEntity: authEntity);
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required AuthEntity authEntity,
  }) {
    return _passwordResetRepository.firebasePasswordReset(
        authEntity: authEntity);
  }
}
