
import 'package:dartz/dartz.dart';
import '../../entity/auth_entity.dart';
import '../../error/api_auth_error.dart';
import '../../error/firebase_auth_error.dart';

abstract class SignInRepository {
  Future<Either<FirebaseAuthError, void>> firebaseSignIn({
    required AuthEntity authEntity,
  });
  Future<Either<ApiAuthError, void>> apiSignIn({
    required AuthEntity authEntity,
  });
}
