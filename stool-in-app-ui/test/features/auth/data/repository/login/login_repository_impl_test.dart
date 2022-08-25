import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/data/datasource/login/login_datasource.dart';
import 'package:stool_in/features/auth/data/model/auth_model.dart';
import 'package:stool_in/features/auth/data/repository/login/login_repository_impl.dart';
import 'package:stool_in/features/auth/domain/entity/auth_entity.dart';
import 'package:stool_in/features/auth/domain/entity/user_token_entity.dart';
import 'package:stool_in/features/auth/domain/error/api_auth_error.dart';
import 'package:stool_in/features/auth/domain/error/firebase_auth_error.dart';
import 'package:stool_in/features/auth/domain/repository/login/login_repository.dart';

class _LoginDatasourceMock extends Mock implements LoginDatasource {}


class _UserTokenEntityMock extends Mock implements UserTokenEntity {}

void main() {
  late _LoginDatasourceMock loginDatasourceMock;
  late AuthEntity authEntity;
  late LoginRepository loginRepository;
  late _UserTokenEntityMock userTokenEntityMock;
  setUp(
    () {
      final faker = Faker();
      loginDatasourceMock = _LoginDatasourceMock();
      authEntity = AuthEntity(
        email: faker.internet.email(),
        password: faker.internet.password(),
      );
      userTokenEntityMock = _UserTokenEntityMock();
      loginRepository =
          LoginRepositoryImpl(loginDatasource: loginDatasourceMock);
    },
  );

  group('Api login', () {
    test('Deve retornar uma token entity para apiLogin', () async {
      when(
        () => loginDatasourceMock.apiLogin(
            authModel: AuthModel.fromEntity(authEntity)),
      ).thenAnswer((_) async => userTokenEntityMock);
      final sut = await loginRepository.apiLogin(authEntity: authEntity);
      expect(sut, Right(userTokenEntityMock));
    });
    test('Deve retornar um erro para apiLogin', () async {
      when(
        () => loginDatasourceMock.apiLogin(
            authModel: AuthModel.fromEntity(authEntity)),
      ).thenThrow(ApiAuthError(message: 'message'));
      final sut = loginRepository.apiLogin;
      expect(
        await sut(authEntity: authEntity),
        Left(
          ApiAuthError(message: 'message'),
        ),
      );
    });
    test('Deve chamar o datasource para apiLogin', () async {
      when(
        () => loginDatasourceMock.apiLogin(
            authModel: AuthModel.fromEntity(authEntity)),
      ).thenAnswer((_) async => userTokenEntityMock);
      final sut = await loginRepository.apiLogin(authEntity: authEntity);
      expect(sut, Right(userTokenEntityMock));
      verify(
        () => loginDatasourceMock.apiLogin(
            authModel: AuthModel.fromEntity(authEntity)),
      ).called(1);
    });
  });

  group('Firebase login', () {
    test('Deve chamar o datasource para firebaseLogin', () async {
      when(
        () => loginDatasourceMock.firebaseLogin(
            authModel: AuthModel.fromEntity(authEntity)),
      ).thenAnswer((_) async => Future.value());
      final sut = await loginRepository.firebaseLogin(authEntity: authEntity);
      expect(sut, const Right(null));
      verify(
        () => loginDatasourceMock.firebaseLogin(
            authModel: AuthModel.fromEntity(authEntity)),
      ).called(1);
    });
    test('Deve retornar um tipo void', () async {
      when(
        () => loginDatasourceMock.firebaseLogin(
            authModel: AuthModel.fromEntity(authEntity)),
      ).thenAnswer((_) async => Future.value());
      final sut = await loginRepository.firebaseLogin(authEntity: authEntity);
      expect(sut, const Right(null));
    });
    test('Deve retornar um erro para firebaseLogin', () async {
      when(
        () => loginDatasourceMock.firebaseLogin(
            authModel: AuthModel.fromEntity(authEntity)),
      ).thenThrow(FirebaseAuthError(message: 'message'));
      final sut = await loginRepository.firebaseLogin(authEntity: authEntity);
      expect(sut, Left(FirebaseAuthError(message: 'message')));
    });
  });
}
