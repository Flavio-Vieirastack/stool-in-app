import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/core/helpers/shared_preferences/shared_preferences_helper.dart';

class PreferencesMock extends Mock implements SharedPreferencesHelper {}

void main() {
  test('Deve retornar o valor correto ao pegar um bool', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final mock = PreferencesMock();
    when(
      () => mock.getBool(key: 'any()'),
    ).thenAnswer((invocation) async => true);
    final sut = await mock.getBool(key: 'any()');
    expect(sut, true);
  });
  test('Deve retornar o valor correto ao pegar uma string', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final mock = PreferencesMock();
    when(
      () => mock.getString(key: 'any()'),
    ).thenAnswer((invocation) async => 'true');
    final sut = await mock.getString(key: 'any()');
    expect(sut, 'true');
  });
  test('Deve retornar o valor correto ao pegar um int', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final mock = PreferencesMock();
    when(
      () => mock.getInt(key: 'any()'),
    ).thenAnswer((invocation) async => 1);
    final sut = await mock.getInt(key: 'any()');
    expect(sut, 1);
  });
  test('Deve retornar o valor correto ao pegar um double', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final mock = PreferencesMock();
    when(
      () => mock.getDouble(key: 'any()'),
    ).thenAnswer((invocation) async => 1.5);
    final sut = await mock.getDouble(key: 'any()');
    expect(sut, 1.5);
  });
  test('Deve retornar o valor correto ao pegar uma lista de strings', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final mock = PreferencesMock();
    when(
      () => mock.getStringList(key: 'any()'),
    ).thenAnswer((invocation) async => ['any()', 'any()']);
    final sut = await mock.getStringList(key: 'any()');
    expect(sut, isNotEmpty);
  });
}
