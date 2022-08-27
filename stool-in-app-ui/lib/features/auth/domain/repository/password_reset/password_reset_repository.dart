import 'package:dartz/dartz.dart';
import '../../../export/auth_exports.dart';


abstract class PasswordResetRepository {
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required AuthEntity authEntity,
  });
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required AuthEntity authEntity,
  });
}
