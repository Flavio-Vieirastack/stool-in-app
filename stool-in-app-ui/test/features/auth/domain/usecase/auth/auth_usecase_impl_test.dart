import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dartz/dartz.dart';
import 'package:stool_in/features/auth/data/datasource/login/login_datasource.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_token_entity.dart';
import 'package:stool_in/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in/features/auth/domain/error/user_data_error.dart';
import 'package:stool_in/features/auth/domain/repository/login/login_repository.dart';
import 'package:stool_in/features/auth/domain/repository/password_reset/password_reset_repository.dart';
import 'package:stool_in/features/auth/domain/repository/sign_in/sign_in_repository.dart';
import 'package:stool_in/features/auth/domain/repository/user_data/user_data_sign_in_respository.dart';
import 'package:stool_in/features/auth/domain/usecase/auth/auth_use_case.dart';
import 'package:stool_in/features/auth/domain/usecase/auth/auth_usecase_impl.dart';

class AuthMock extends Mock implements AuthUseCase {}

class RepositoryMock extends Mock implements UserDataSignInRepository {}

class LoginRepositoryMock extends Mock implements LoginRepository {}

class SignInRepositoryMock extends Mock implements SignInRepository {}

class PasswordRepositoryMock extends Mock implements PasswordResetRepository {}

class UserDataSignInMock extends Mock implements UserDataSignInRepository {}

class UserLoginMock extends Mock implements LoginDatasource {}

void main() {
  test('Deve retornar a entidade correta ao ser chamado', () async {
    final useCaseMock = AuthMock();
    final entity = UserDataEntity();
    when(
      () => useCaseMock.sendUserData(userDataEntity: entity),
    ).thenAnswer(
      (_) async => Right(
        UserDataEntity(),
      ),
    );
    final sut = await useCaseMock.sendUserData(userDataEntity: entity);
    expect(sut, Right(entity));
  });
  test('Deve retornar a entidade correta ao chamar metodo de login', () async {
    final useCaseMock = AuthMock();
    final token = UserTokenEntity(token: '');
    final entity = AuthEntity(email: 'email', password: 'password');
    when(
      () => useCaseMock.apiLogin(authEntity: entity),
    ).thenAnswer(
      (_) async => Right(
        UserTokenEntity(token: ''),
      ),
    );
    final sut = await useCaseMock.apiLogin(authEntity: entity);
    expect(sut, Right(token));
  });
  test('Deve retornar um erro do tipo correto', () async {
    final useCaseMock = AuthMock();
    final entity = UserDataEntity();
    when(
      () => useCaseMock.sendUserData(userDataEntity: entity),
    ).thenAnswer(
      (_) async => Left(
        UserDataError(message: ''),
      ),
    );
    final sut = useCaseMock.sendUserData;
    expect(
      await sut(userDataEntity: entity),
      Left(
        UserDataError(message: ''),
      ),
    );
  });
  test('Deve retornar um erro do tipo correto ao chamar login', () async {
    final useCaseMock = AuthMock();
    final entity = AuthEntity(email: '', password: '');
    when(
      () => useCaseMock.apiLogin(authEntity: entity),
    ).thenAnswer(
      (_) async => Left(
        ApiAuthError(message: ''),
      ),
    );
    final sut = useCaseMock.apiLogin;
    expect(
      await sut(authEntity: entity),
      Left(
        ApiAuthError(message: ''),
      ),
    );
  });
  test('Deve chamar o repository quando o useCase for chamado durante login',
      () async {
    final entity = AuthEntity(email: '', password: '');
    final token = UserTokenEntity(token: '');
    final loginRepositoryMock = LoginRepositoryMock();
    final signInRepositoryMock = SignInRepositoryMock();
    final passwordResetRepository = PasswordRepositoryMock();
    final userDataSignInMock = UserDataSignInMock();
    final useCaseImpl = AuthUsecaseImpl(
        loginRepository: loginRepositoryMock,
        signInRepository: signInRepositoryMock,
        passwordResetRepository: passwordResetRepository,
        userDataSignInRepository: userDataSignInMock);
    when(
      () => loginRepositoryMock.apiLogin(authEntity: entity),
    ).thenAnswer(
      (_) async => Right(
        token,
      ),
    );
    final sut = await useCaseImpl.apiLogin(authEntity: entity);
    verify(
      () => loginRepositoryMock.apiLogin(authEntity: entity),
    ).called(1);
    expect(sut, Right(token));
  });
  test('Deve chamar o repository quando o useCase for chamado', () async {
    final entity = UserDataEntity();
    final loginRepositoryMock = LoginRepositoryMock();
    final signInRepositoryMock = SignInRepositoryMock();
    final passwordResetRepository = PasswordRepositoryMock();
    final userDataSignInMock = UserDataSignInMock();
    final useCaseImpl = AuthUsecaseImpl(
        loginRepository: loginRepositoryMock,
        signInRepository: signInRepositoryMock,
        passwordResetRepository: passwordResetRepository,
        userDataSignInRepository: userDataSignInMock);
    when(
      () => userDataSignInMock.sendUserData(userDataEntity: entity),
    ).thenAnswer(
      (_) async => Right(
        entity,
      ),
    );
    final sut = await useCaseImpl.sendUserData(userDataEntity: entity);
    verify(
      () => userDataSignInMock.sendUserData(userDataEntity: entity),
    ).called(1);
    expect(sut, Right(entity));
  });
}
