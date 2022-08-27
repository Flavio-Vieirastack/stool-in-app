import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';


class _SignInDataSourceMock extends Mock implements SignInDatasource {}

void main() {
  late _SignInDataSourceMock signInDataSourceMock;
  late SignInRepository signInRepository;
  late AuthEntity authEntity;
  setUp(() {
    final faker = Faker();
    signInDataSourceMock = _SignInDataSourceMock();
    authEntity = AuthEntity(
      email: faker.internet.email(),
      password: faker.internet.password(),
      firebaseUuid: faker.internet.password(),
    );
    signInRepository =
        SignInRepositoryImpl(signInDatasource: signInDataSourceMock);
  });
  test('Deve retornar o valor void para sign in', () async {
    when(() => signInDataSourceMock.apiSignIn(
            authModel: AuthModel.fromEntity(authEntity)))
        .thenAnswer((_) async => Future.value());
    final sut = await signInRepository.apiSignIn(authEntity: authEntity);
    expect(sut, const Right(null));
  });
  test('Deve retornar chamar o datasource para sign in', () async {
    when(
      () => signInDataSourceMock.apiSignIn(
        authModel: AuthModel.fromEntity(authEntity),
      ),
    ).thenAnswer((_) async => Future.value());
    final sut = await signInRepository.apiSignIn(authEntity: authEntity);
    expect(sut, const Right(null));
    verify(
      () => signInDataSourceMock.apiSignIn(
          authModel: AuthModel.fromEntity(authEntity)),
    ).called(1);
  });
  test('Deve retornar um erro do tipo correto para sign in', () async {
    when(
      () => signInDataSourceMock.apiSignIn(
        authModel: AuthModel.fromEntity(authEntity),
      ),
    ).thenThrow(ApiAuthError(message: 'message'));
    final sut = signInRepository.apiSignIn;
    expect(await sut(authEntity: authEntity), Left(ApiAuthError(message: 'message')));
  });
}
