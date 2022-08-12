import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_token_entity.dart';
import 'package:stool_in/features/auth/domain/repository/login/login_repository.dart';
import 'package:stool_in/features/auth/domain/repository/password_reset/password_reset_repository.dart';
import 'package:stool_in/features/auth/domain/repository/sign_in/sign_in_repository.dart';
import 'package:stool_in/features/auth/domain/repository/user_data/user_data_sign_in_respository.dart';

import 'package:stool_in/features/auth/domain/usecase/auth/auth_use_case.dart';
import 'package:stool_in/features/auth/domain/usecase/auth/auth_usecase_impl.dart';

class AuthUseCaseMock extends Mock implements AuthUseCase {}

class LoginRepositoryMock extends Mock implements LoginRepository {}

class SignInRepositoryMock extends Mock implements SignInRepository {}

class PasswordResetRepostoryMock extends Mock
    implements PasswordResetRepository {}

class UserDataSignInRepositoryMock extends Mock
    implements UserDataSignInRepository {}

class AuthEntityMock extends Mock implements AuthEntity {}

class UserTokenEntityMock extends Mock implements UserTokenEntity {}

class UserDataEntityMock extends Mock implements UserDataEntity {}

void main() {
  late LoginRepository loginRepository;
  late SignInRepository signInRepository;
  late PasswordResetRepository passwordResetRepository;
  late UserDataSignInRepository userDataSignInRepository;
  late AuthUseCase authUseCaseIml;
  late AuthEntity authEntity;
  late UserTokenEntity userTokenEntity;
  late UserDataEntity userDataEntity;
  setUp(() {
    loginRepository = LoginRepositoryMock();
    signInRepository = SignInRepositoryMock();
    passwordResetRepository = PasswordResetRepostoryMock();
    userDataSignInRepository = UserDataSignInRepositoryMock();
    authUseCaseIml = AuthUsecaseImpl(
      loginRepository: loginRepository,
      signInRepository: signInRepository,
      passwordResetRepository: passwordResetRepository,
      userDataSignInRepository: userDataSignInRepository,
    );
    authEntity = AuthEntityMock();
    userTokenEntity = UserTokenEntityMock();
    userDataEntity = UserDataEntityMock();
  });
  test('Deve retornar uma entidade de token', () async {
    when(
      () => loginRepository.apiLogin(authEntity: authEntity),
    ).thenAnswer((_) async => Right(userTokenEntity));
    final sut = await authUseCaseIml.apiLogin(authEntity: authEntity);
    expect(sut, Right(userTokenEntity));
  });
  test('Deve retornar uma entidade de useDataEntity', () async {
    when(
      () => userDataSignInRepository.sendUserData(userDataEntity: userDataEntity),
    ).thenAnswer((_) async => Right(userDataEntity));
    final sut = await authUseCaseIml.sendUserData(userDataEntity: userDataEntity);
    expect(sut, Right(userDataEntity));
  });
}
