import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_app_ui/features/auth/data/model/user_token_model.dart';

void main() {
  test('Deve retornar o valor correto do token', () {
    final faker = Faker();
    final token = faker.jwt.valid();
    final model = UserTokenModel(token: token);
    expect(model.token, token);
  });
  test('Deve retornar o valor correto do token pelo from map', () {
    final faker = Faker();
    final token = faker.jwt.valid();
    final mapMock = {"access_token": token};
    final model = UserTokenModel.fromMap(mapMock);
    expect(model.token, token);
  });
}
