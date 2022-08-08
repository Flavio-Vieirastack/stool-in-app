import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/login/login_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/model/auth_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_token_entity.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/api_auth_error.dart';

class LoginDatasourceMock extends Mock implements LoginDatasource {}

void main() {
  test('Deve retornar o token corretamente', () async {
    final faker = Faker();
    final email = faker.internet.email();
    final token = faker.jwt.valid();
    final loginDataMock = LoginDatasourceMock();
    final authModel = AuthModel(email: email);
    final entity = UserTokenEntity(token: token);
    when(
      () => loginDataMock.apiLogin(authModel: authModel),
    ).thenAnswer((_) async => entity);
    final sut = await loginDataMock.apiLogin(authModel: authModel);
    expect(sut, entity);
  });
  test('Deve retornar um erro corretamente', () async {
    final faker = Faker();
    final email = faker.internet.email();
    final loginDataMock = LoginDatasourceMock();
    final authModel = AuthModel(email: email);
    when(
      () => loginDataMock.apiLogin(authModel: authModel),
    ).thenThrow(ApiAuthError(message: 'message'));
    final sut = loginDataMock.apiLogin;
    expect(() async => sut(authModel: authModel), throwsException);
  });
}
