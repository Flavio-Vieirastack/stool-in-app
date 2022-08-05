import 'package:dartz/dartz.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/repository/login/login_repository.dart';

import 'login_use_case.dart';

class LoginUsecaseImpl implements LoginUseCase {
  final LoginRepository _authRepository;
  LoginUsecaseImpl({
    required LoginRepository authRepository,
  }) : _authRepository = authRepository;

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
}
