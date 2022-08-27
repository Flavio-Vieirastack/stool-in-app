import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/export/auth_exports.dart';



class _LoginRepositoryMock extends Mock implements LoginRepository {}

class _SignInRepositoryMock extends Mock implements SignInRepository {}

class _PasswordResetRepostoryMock extends Mock
    implements PasswordResetRepository {}

class _UserDataSignInRepositoryMock extends Mock
    implements UserDataSignInRepository {}

class _AuthEntityMock extends Mock implements AuthEntity {}

class _UserTokenEntityMock extends Mock implements UserTokenEntity {}

class _UserDataEntityMock extends Mock implements UserDataEntity {}

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
    loginRepository = _LoginRepositoryMock();
    signInRepository = _SignInRepositoryMock();
    passwordResetRepository = _PasswordResetRepostoryMock();
    userDataSignInRepository = _UserDataSignInRepositoryMock();
    authUseCaseIml = AuthUsecaseImpl(
      loginRepository: loginRepository,
      signInRepository: signInRepository,
      passwordResetRepository: passwordResetRepository,
      userDataSignInRepository: userDataSignInRepository,
    );
    authEntity = _AuthEntityMock();
    userTokenEntity = _UserTokenEntityMock();
    userDataEntity = _UserDataEntityMock();
  });
  group('api login tests', () {
    test('Deve retornar uma entidade de token', () async {
      when(
        () => loginRepository.apiLogin(authEntity: authEntity),
      ).thenAnswer((_) async => Right(userTokenEntity));
      final sut = await authUseCaseIml.apiLogin(authEntity: authEntity);
      expect(sut, Right(userTokenEntity));
    });
    test('Deve chamar o login repository', () async {
      when(
        () => loginRepository.apiLogin(authEntity: authEntity),
      ).thenAnswer((_) async => Right(userTokenEntity));
      final sut = await authUseCaseIml.apiLogin(authEntity: authEntity);
      expect(sut, Right(userTokenEntity));
      verify(
        () => loginRepository.apiLogin(authEntity: authEntity),
      ).called(1);
    });
    test('Deve retornar um erro do tipo correto para login', () async {
      when(
        () => loginRepository.apiLogin(authEntity: authEntity),
      ).thenAnswer((_) async => Left(ApiAuthError(message: 'message')));
      final sut = authUseCaseIml.apiLogin;
      expect(
        await sut(authEntity: authEntity),
        Left(
          ApiAuthError(message: 'message'),
        ),
      );
    });
  });

  group('sendUserData tests', () {
    test('Deve retornar uma entidade de useDataEntity', () async {
      when(
        () => userDataSignInRepository.sendUserData(
            userDataEntity: userDataEntity),
      ).thenAnswer((_) async => Right(userDataEntity));
      final sut =
          await authUseCaseIml.sendUserData(userDataEntity: userDataEntity);
      expect(sut, Right(userDataEntity));
    });
    test('Deve retornar chamar o userData sign in repository', () async {
      when(
        () => userDataSignInRepository.sendUserData(
            userDataEntity: userDataEntity),
      ).thenAnswer((_) async => Right(userDataEntity));
      final sut =
          await authUseCaseIml.sendUserData(userDataEntity: userDataEntity);
      expect(sut, Right(userDataEntity));
      verify(
        () => userDataSignInRepository.sendUserData(
            userDataEntity: userDataEntity),
      ).called(1);
    });
    test('Deve retornar um erro do tipo correto para user data', () async {
      when(
        () => userDataSignInRepository.sendUserData(
            userDataEntity: userDataEntity),
      ).thenAnswer(
        (_) async => Left(
          UserDataError(message: 'message'),
        ),
      );
      final sut = authUseCaseIml.sendUserData;
      expect(
        await sut(userDataEntity: userDataEntity),
        Left(
          UserDataError(message: 'message'),
        ),
      );
    });
  });

  group('apiSignIn tests', () {
    test('Deve retornar uma instância de right', () async {
      when(
        () => signInRepository.apiSignIn(authEntity: authEntity),
      ).thenAnswer((_) async => const Right(null));
      final sut = await signInRepository.apiSignIn(authEntity: authEntity);
      expect(sut, isA<Right>());
    });
    test('Deve retornar um erro do tipo coreto para o sign in repository',
        () async {
      when(
        () => signInRepository.apiSignIn(authEntity: authEntity),
      ).thenAnswer((_) async => Left(ApiAuthError(message: 'message')));
      final sut = signInRepository.apiSignIn;
      expect(await sut(authEntity: authEntity),
          Left(ApiAuthError(message: 'message')));
    });
    test('Deve chamar o repository correto para api sign in', () async {
      when(
        () => signInRepository.apiSignIn(authEntity: authEntity),
      ).thenAnswer((_) async => Left(ApiAuthError(message: 'message')));
      final sut = signInRepository.apiSignIn;
      expect(
        await sut(authEntity: authEntity),
        Left(
          ApiAuthError(message: 'message'),
        ),
      );
      verify(
        () => signInRepository.apiSignIn(authEntity: authEntity),
      ).called(1);
    });
  });

  group('Firebase login tests', () {
    test('Deve chamar o repository corretamente', () async {
      when(
        () => loginRepository.firebaseLogin(authEntity: authEntity),
      ).thenAnswer((_) async => const Right(null));
      final sut = await authUseCaseIml.firebaseLogin(authEntity: authEntity);
      expect(sut, const Right(null));
      verify(
        () => loginRepository.firebaseLogin(authEntity: authEntity),
      ).called(1);
    });
    test('Deve retornar o tipo void para firebaseLogin', () async {
      when(
        () => loginRepository.firebaseLogin(authEntity: authEntity),
      ).thenAnswer((_) async => const Right(null));
      final sut = await authUseCaseIml.firebaseLogin(authEntity: authEntity);
      expect(sut, const Right(null));
    });
    test('Deve chamar retornar um erro para firebaselogin corretamente',
        () async {
      when(
        () => loginRepository.firebaseLogin(authEntity: authEntity),
      ).thenAnswer((_) async => Left(FirebaseAuthError(message: 'message')));
      final sut = authUseCaseIml.firebaseLogin;
      expect(await sut(authEntity: authEntity),
          Left(FirebaseAuthError(message: 'message')));
    });
  });

  group('firebaseSignIn tests', () {
    test('Deve chamar o sign in repository corretamente para firebase sign in',
        () async {
      when(
        () => signInRepository.firebaseSignIn(authEntity: authEntity),
      ).thenAnswer((_) async => const Right(null));
      final sut = await authUseCaseIml.firebaseSignIn(authEntity: authEntity);
      expect(sut, const Right(null));
      verify(
        () => signInRepository.firebaseSignIn(authEntity: authEntity),
      ).called(1);
    });
    test('Deve chamar retornar um erro correto para firebase sign in',
        () async {
      when(
        () => signInRepository.firebaseSignIn(authEntity: authEntity),
      ).thenAnswer((_) async => Left(FirebaseAuthError(message: 'message')));
      final sut = await authUseCaseIml.firebaseSignIn(authEntity: authEntity);
      expect(sut, Left(FirebaseAuthError(message: 'message')));
    });
  });

  group('apiPasswordReset tests', () {
    test('Deve chamar o repository correto para api password reset', () async {
      when(
        () => passwordResetRepository.apiPasswordReset(authEntity: authEntity),
      ).thenAnswer((_) async => const Right(null));
      final sut = await authUseCaseIml.apiPasswordReset(authEntity: authEntity);
      expect(sut, const Right(null));
      verify(
        () => passwordResetRepository.apiPasswordReset(authEntity: authEntity),
      ).called(1);
    });
    test('Deve chamar retornar o erro correto para api password reset',
        () async {
      when(
        () => passwordResetRepository.apiPasswordReset(authEntity: authEntity),
      ).thenAnswer((_) async => Left(ApiAuthError(message: 'message')));
      final sut = await authUseCaseIml.apiPasswordReset(authEntity: authEntity);
      expect(sut, Left(ApiAuthError(message: 'message')));
    });
  });

  group('FirebasePasswordReset tests', () {
    test('Deve chamar o repository correto para fisebase password reset',
        () async {
      when(
        () => passwordResetRepository.firebasePasswordReset(
            authEntity: authEntity),
      ).thenAnswer((_) async => const Right(null));
      final sut =
          await authUseCaseIml.firebasePasswordReset(authEntity: authEntity);
      expect(sut, const Right(null));
      verify(
        () => passwordResetRepository.firebasePasswordReset(
            authEntity: authEntity),
      ).called(1);
    });
    test('Deve retornar o erro correto para fisebase password reset', () async {
      when(
        () => passwordResetRepository.firebasePasswordReset(
            authEntity: authEntity),
      ).thenAnswer((_) async => Left(FirebaseAuthError(message: '')));
      final sut = authUseCaseIml.firebasePasswordReset;
      expect(await sut(authEntity: authEntity),
          Left(FirebaseAuthError(message: '')));
    });
  });
}
