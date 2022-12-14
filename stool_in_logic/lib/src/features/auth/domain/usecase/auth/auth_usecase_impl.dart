import 'package:dartz/dartz.dart';

import '../../entity/auth_entity.dart';
import '../../entity/user_data_entity.dart';
import '../../entity/user_token_entity.dart';
import '../../error/api_auth_error.dart';
import '../../error/firebase_auth_error.dart';
import '../../error/user_data_error.dart';
import '../../repository/login/login_repository.dart';
import '../../repository/password_reset/password_reset_repository.dart';
import '../../repository/sign_in/sign_in_repository.dart';
import '../../repository/user_data/user_data_sign_in_respository.dart';
import 'auth_use_case.dart';

class AuthUsecaseImpl implements AuthUseCase {
  final LoginRepository _loginRepository;
  final SignInRepository _signInRepository;
  final PasswordResetRepository _passwordResetRepository;
  final UserDataSignInRepository _userDataSignInRepository;
  AuthUsecaseImpl({
    required LoginRepository loginRepository,
    required SignInRepository signInRepository,
    required PasswordResetRepository passwordResetRepository,
    required UserDataSignInRepository userDataSignInRepository,
  })  : _loginRepository = loginRepository,
        _userDataSignInRepository = userDataSignInRepository,
        _passwordResetRepository = passwordResetRepository,
        _signInRepository = signInRepository;

  @override
  Future<Either<ApiAuthError, UserTokenEntity>> apiLogin({
    required AuthEntity authEntity,
  }) async {
    return await _loginRepository.apiLogin(authEntity: authEntity);
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebaseLogin({
    required AuthEntity authEntity,
  }) async {
    return await _loginRepository.firebaseLogin(authEntity: authEntity);
  }

  @override
  Future<Either<ApiAuthError, void>> apiSignIn({
    required AuthEntity authEntity,
  }) async {
    return await _signInRepository.apiSignIn(authEntity: authEntity);
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebaseSignIn({
    required AuthEntity authEntity,
  }) async {
    return await _signInRepository.firebaseSignIn(authEntity: authEntity);
  }

  @override
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required AuthEntity authEntity,
  }) async {
    return await _passwordResetRepository.apiPasswordReset(
      authEntity: authEntity,
    );
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required AuthEntity authEntity,
  }) async {
    return await _passwordResetRepository.firebasePasswordReset(
      authEntity: authEntity,
    );
  }

  @override
  Future<Either<UserDataError, UserDataEntity>> sendUserData({
    required UserDataEntity userDataEntity,
  }) async {
    return await _userDataSignInRepository.sendUserData(
      userDataEntity: userDataEntity,
    );
  }
}
