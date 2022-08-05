import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in_app_logic/features/auth/domain/repository/password_reset/password_reset_repository.dart';

class PasswordResetRepositoryImpl implements PasswordResetRepository {
  @override
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required AuthEntity authEntity,
  }) {
    // TODO: implement apiPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required AuthEntity authEntity,
  }) {
    // TODO: implement firebasePasswordReset
    throw UnimplementedError();
  }
}
