import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/export/rest_client_export.dart';
import 'package:stool_in/features/auth/export/auth_exports.dart';


class _PatchMock extends Mock implements RestClientPatch {}

class _FirebaseAuthMock extends Mock implements FirebaseAuth {}

void main() {
  late _PatchMock patchMock;
  late PasswordResetDatasource passwordResetDatasource;
  late _FirebaseAuthMock firebaseAuthMock;
  late AuthModel authModel;
  setUp(
    () {
      patchMock = _PatchMock();
      firebaseAuthMock = _FirebaseAuthMock();
      passwordResetDatasource = PasswordResetDatasourceImpl(
          firebaseAuth: firebaseAuthMock, restClientPatch: patchMock);
      authModel = AuthModel(email: 'email', password: 'password');
    },
  );
  test('Deve retornar tipo void ao fazer reset de senha', () async {
    when(
      () => patchMock.patch(path: any(named: 'path'), data: any(named: 'data')),
    ).thenAnswer(
      (_) async => RestClientResponse(data: null, statucCode: 200),
    );
    final sut = passwordResetDatasource.apiPasswordReset(authModel: authModel);
    expect(sut, isA<Future<void>>());
  });
  test('Deve retornar um erro ao fazer reset de senha', () async {
    when(
      () => patchMock.patch(path: any(named: 'path'), data: any(named: 'data')),
    ).thenThrow(
      ApiAuthError(message: 'message'),
    );
    final sut = passwordResetDatasource.apiPasswordReset;
    expect(() async => sut(authModel: authModel), throwsException);
  });
  test('Deve chamar o metodo patch ao fazer reset de senha', () async {
    when(
      () => patchMock.patch(path: any(named: 'path'), data: any(named: 'data')),
    ).thenAnswer(
      (_) async => RestClientResponse(data: null, statucCode: 200),
    );
    final sut = passwordResetDatasource.apiPasswordReset(authModel: authModel);
    expect(sut, isA<Future<void>>());
    verify(
      () => patchMock.patch(path: any(named: 'path'), data: any(named: 'data')),
    ).called(1);
  });
}
