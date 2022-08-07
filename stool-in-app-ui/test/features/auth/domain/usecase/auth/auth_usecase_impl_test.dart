import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:dartz/dartz.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/user_data_error.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/login/login_repository.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/password_reset/password_reset_repository.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/sign_in/sign_in_repository.dart';
import 'package:stool_in_app_ui/features/auth/domain/repository/user_data/user_data_sign_in_respository.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_use_case.dart';
import 'package:stool_in_app_ui/features/auth/domain/usecase/auth/auth_usecase_impl.dart';

class AuthMock extends Mock implements AuthUseCase {}

class RepositoryMock extends Mock implements UserDataSignInRepository {}

class LoginRepositoryMock extends Mock implements LoginRepository {}

class SignInRepositoryMock extends Mock implements SignInRepository {}

class PasswordRepositoryMock extends Mock implements PasswordResetRepository {}

class UserDataSignInMock extends Mock implements UserDataSignInRepository {}

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
