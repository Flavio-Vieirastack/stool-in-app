import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';


abstract class PasswordResetRepository {
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required AuthEntity authEntity,
  });
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required AuthEntity authEntity,
  });
}
