import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';

abstract class LoginRepository {
  Future<Either<FirebaseAuthError, void>> firebaseLogin({
    required AuthEntity authEntity,
  });
  Future<Either<ApiAuthError, UserTokenEntity>> apiLogin({
    required AuthEntity authEntity,
  });
}
