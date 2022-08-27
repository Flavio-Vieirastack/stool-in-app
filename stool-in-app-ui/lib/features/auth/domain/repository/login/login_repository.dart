import 'package:dartz/dartz.dart';
import '../../../export/auth_exports.dart';

abstract class LoginRepository {
  Future<Either<FirebaseAuthError, void>> firebaseLogin({
    required AuthEntity authEntity,
  });
  Future<Either<ApiAuthError, UserTokenEntity>> apiLogin({
    required AuthEntity authEntity,
  });
}
