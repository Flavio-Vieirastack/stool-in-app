import 'package:dartz/dartz.dart';
import '../../entity/auth_entity.dart';
import '../../error/api_auth_error.dart';
import '../../error/firebase_auth_error.dart';


abstract class PasswordResetRepository {
  Future<Either<ApiAuthError, void>> apiPasswordReset({
    required AuthEntity authEntity,
  });
  Future<Either<FirebaseAuthError, void>> firebasePasswordReset({
    required AuthEntity authEntity,
  });
}
