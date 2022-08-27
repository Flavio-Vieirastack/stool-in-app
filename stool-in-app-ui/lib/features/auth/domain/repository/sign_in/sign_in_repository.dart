
import 'package:dartz/dartz.dart';
import '../../../export/auth_exports.dart';

abstract class SignInRepository {
  Future<Either<FirebaseAuthError, void>> firebaseSignIn({
    required AuthEntity authEntity,
  });
  Future<Either<ApiAuthError, void>> apiSignIn({
    required AuthEntity authEntity,
  });
}
