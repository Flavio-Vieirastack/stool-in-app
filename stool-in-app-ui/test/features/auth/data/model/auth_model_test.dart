import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

void main() {
  test('deve retornar os valores do model corretamente com email', () {
    final faker = Faker();
    final email = faker.internet.email();
    final password = faker.internet.password();
    final model = AuthModel(
      email: email,
      password: password,
    ).toMap();
    final sut = model['email'];
    expect(sut, email);
    expect(sut, isA<String>());
  });
  test('deve retornar os valores do model corretamente com senha', () {
    final faker = Faker();
    final email = faker.internet.email();
    final password = faker.internet.password();
    final model = AuthModel(
      email: email,
      password: password,
    ).toMap();
    final sut = model['password'];
    expect(sut, password);
    expect(sut, isA<String>());
  });
  test('deve retornar os valores do model corretamente com firebase uuid', () {
    final faker = Faker();
    final email = faker.internet.email();
    final password = faker.internet.password();
    final uuid = faker.randomGenerator.string(20);
    final model =
        AuthModel(email: email, password: password, firebaseUuid: uuid).toMap();
    final sut = model['firebaseUuid'];
    expect(sut, uuid);
    expect(sut, isA<String>());
  });
}
