import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/auth/data/datasource/sign_in/sign_in_datasource.dart';
import 'package:stool_in/features/auth/data/datasource/sign_in/sign_in_datasource_impl.dart';
import 'package:stool_in/features/auth/data/model/auth_model.dart';
import 'package:stool_in/features/auth/domain/error/api_auth_error.dart';

class _RestClientPostMock extends Mock implements RestClientPost {}

class _FirebabseAuthMock extends Mock implements FirebaseAuth {}

void main() {
  late _RestClientPostMock restClientPostMock;
  late AuthModel authModel;
  late SignInDatasource signInDatasource;
  late _FirebabseAuthMock firebabseAuthMock;
  setUp(
    () {
      final faker = Faker();
      authModel = AuthModel(
        email: faker.internet.email(),
        password: faker.internet.password(),
      );
      firebabseAuthMock = _FirebabseAuthMock();
      restClientPostMock = _RestClientPostMock();
      signInDatasource = SignInDatasourceImpl(
          firebaseAuth: firebabseAuthMock, restClientPost: restClientPostMock);
    },
  );
  test('Deve retornar um tipo void para sign in datasource', () async {
    when(
      () => restClientPostMock.post(
        path: any(named: 'path'),
        data: authModel.toMap(),
      ),
    ).thenAnswer((_) async => RestClientResponse(data: null, statucCode: 200));
    final sut = signInDatasource.apiSignIn(authModel: authModel);
    expect(sut, isA<Future<void>>());
  });
  test('Deve retornar um erro para sign in datasource', () async {
    when(
      () => restClientPostMock.post(
        path: any(named: 'path'),
        data: authModel.toMap(),
      ),
    ).thenThrow(ApiAuthError(message: 'message'));
    final sut = signInDatasource.apiSignIn;
    expect(() async => sut(authModel: authModel), throwsException);
  });
  test('Deve chamar o metodo post para sign in datasource', () async {
    when(
      () => restClientPostMock.post(
        path: any(named: 'path'),
        data: authModel.toMap(),
      ),
    ).thenAnswer((_) async => RestClientResponse(data: null, statucCode: 200));
    final sut = signInDatasource.apiSignIn(authModel: authModel);
    expect(sut, isA<Future<void>>());
    verify(
      () => restClientPostMock.post(
        path: any(named: 'path'),
        data: authModel.toMap(),
      ),
    ).called(1);
  });
}
