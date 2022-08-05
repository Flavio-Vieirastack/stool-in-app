import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_logic/stool_in_app_logic.dart';

import '../entity/auth_entity.dart';

abstract class AuthUseCase {
  Future<Either<FirebaseAuthError, void>> firebaseAuth(
      {required AuthEntity authEntity});
  Future<Either<ApiAuthError, void>> apiAuth({required AuthEntity authEntity});
}
