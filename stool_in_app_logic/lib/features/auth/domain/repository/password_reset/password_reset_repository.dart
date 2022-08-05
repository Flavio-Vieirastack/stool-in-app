import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_logic/stool_in_app_logic.dart';

abstract class PasswordResetRepository {
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required AuthEntity authEntity,
  });
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required AuthEntity authEntity,
  });
}
