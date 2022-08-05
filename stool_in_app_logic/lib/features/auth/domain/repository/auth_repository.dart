import 'package:dartz/dartz.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';

import '../error/api_auth_error.dart';
import '../error/firebase_auth_error.dart';

abstract class AuthRepository {
  Future<Either<FirebaseAuthError, void>> firebaseAuth(
      {required AuthEntity authEntity});
  Future<Either<ApiAuthError, void>> apiAuth({required AuthEntity authEntity});
}
