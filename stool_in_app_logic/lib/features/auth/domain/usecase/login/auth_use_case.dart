import 'package:stool_in_app_logic/features/auth/domain/entity/password_reset_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_logic/stool_in_app_logic.dart';

import '../../entity/auth_entity.dart';

abstract class AuthUseCase {
  Future<Either<FirebaseAuthError, void>> firebaseLogin({
    required AuthEntity authEntity,
  });
  Future<Either<ApiAuthError, void>> apiLogin({
    required AuthEntity authEntity,
  });
  Future<Either<FirebaseAuthError, void>> firebaseSignIn({
    required AuthEntity authEntity,
  });
  Future<Either<ApiAuthError, void>> apiSignIn({
    required AuthEntity authEntity,
  });
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required PasswordResetEntity passwordResetEntity,
  });
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required PasswordResetEntity passwordResetEntity,
  });
}
