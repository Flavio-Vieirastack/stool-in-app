import 'package:dartz/dartz.dart';
import 'package:stool_in_app_logic/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in_app_logic/features/auth/domain/repository/auth_repository.dart';
import 'package:stool_in_app_logic/features/auth/domain/usecase/auth_use_case.dart';

class AuthUsecaseImpl implements AuthUseCase {
  final AuthRepository _authRepository;
  AuthUsecaseImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<ApiAuthError, void>> apiAuth({
    required AuthEntity authEntity,
  }) {
    return _authRepository.apiAuth(authEntity: authEntity);
  }

  @override
  Future<Either<FirebaseAuthError, void>> firebaseAuth({
    required AuthEntity authEntity,
  }) {
    return _authRepository.firebaseAuth(authEntity: authEntity);
  }
}
