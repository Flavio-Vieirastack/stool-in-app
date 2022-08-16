import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/data/datasource/password_reset/password_reset_datasource.dart';
import 'package:stool_in/features/auth/data/model/auth_model.dart';
import 'package:stool_in/features/auth/data/repository/password_reset/password_reset_repository_impl.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in/features/auth/domain/repository/password_reset/password_reset_repository.dart';

class PasswordResetDatasourceMock extends Mock
    implements PasswordResetDatasource {}

class AuthModeMock extends Mock implements AuthModel {}

void main() {
  late PasswordResetDatasourceMock passwordResetDatasourceMock;
  late PasswordResetRepository passwordResetRepository;
  late AuthEntity authEntity;
  setUp(() {
    final faker = Faker();
    passwordResetDatasourceMock = PasswordResetDatasourceMock();
    passwordResetRepository = PasswordResetRepositoryImpl(
        passwordResetDatasource: passwordResetDatasourceMock);
    authEntity = AuthEntity(
        email: faker.internet.email(),
        password: faker.internet.password(),
        firebaseUuid: faker.internet.password());
  });
  test('Deve chamar o datasource corretamente', () async {
    when(
      () => passwordResetDatasourceMock.apiPasswordReset(
        authModel: AuthModel.fromEntity(authEntity),
      ),
    ).thenAnswer((_) async => Future.value());
    final sut =
        await passwordResetRepository.apiPasswordReset(authEntity: authEntity);
    expect(sut, const Right(null));
    verify(
      () => passwordResetDatasourceMock.apiPasswordReset(
          authModel: AuthModel.fromEntity(authEntity)),
    ).called(1);
  });
  test('Deve um valor void no right', () async {
    when(
      () => passwordResetDatasourceMock.apiPasswordReset(
        authModel: AuthModel.fromEntity(authEntity),
      ),
    ).thenAnswer((_) async => Future.value());
    final sut =
        await passwordResetRepository.apiPasswordReset(authEntity: authEntity);
    expect(sut, const Right(null));
  });
  test('Deve retornar um erro corretamente', () async {
    when(
      () => passwordResetDatasourceMock.apiPasswordReset(
        authModel: AuthModel.fromEntity(authEntity),
      ),
    ).thenThrow(ApiAuthError(message: 'message'));
    final sut = passwordResetRepository.apiPasswordReset;
    expect(
      await sut(authEntity: authEntity),
      Left(
        ApiAuthError(message: 'message'),
      ),
    );
  });
}
