
import 'package:dartz/dartz.dart';
import '../../../../../exports/app_exports.dart';

abstract class SignInRepository {
  Future<Either<FirebaseAuthError, void>> firebaseSignIn({
    required AuthEntity authEntity,
  });
  Future<Either<ApiAuthError, void>> apiSignIn({
    required AuthEntity authEntity,
  });
}
