import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stool_in/core/helpers/export/helpers_export.dart';


class MockMixin with SharedPreferencesHelper {}

void main() {
  late MockMixin mockMixin;
  setUp(() {
    mockMixin = MockMixin();
  });

  test(
      'Deve retornar o valor booleano correto como true para o shared preferences',
      () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await mockMixin.saveBool(key: 'teste', value: true);
    final sut = await mockMixin.getBool(key: 'teste');

    expect(sut, true);
  });
  test(
      'Deve retornar o valor booleano correto como false para o shared preferences',
      () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await mockMixin.saveBool(key: 'teste', value: false);
    final sut = await mockMixin.getBool(key: 'teste');

    expect(sut, false);
  });
  test(
      'Deve retornar o valor double correto para o shared preferences',
      () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await mockMixin.saveDouble(key: 'teste', value: 2.0);
    final sut = await mockMixin.getDouble(key: 'teste');

    expect(sut, 2.0);
  });
  test(
      'Deve retornar o valor int correto para o shared preferences',
      () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await mockMixin.saveInt(key: 'teste', value: 1);
    final sut = await mockMixin.getInt(key: 'teste');

    expect(sut, 1);
  });
  test(
      'Deve retornar o valor string correto para o shared preferences',
      () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await mockMixin.saveString(key: 'teste', value: 'teste');
    final sut = await mockMixin.getString(key: 'teste');

    expect(sut, 'teste');
  });
  test(
      'Deve retornar o valor string list correto para o shared preferences',
      () async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await mockMixin.saveStringList(key: 'teste', value: ['teste', 'teste2']);
    final sut = await mockMixin.getStringList(key: 'teste');

    expect(sut?.length, 2);
  });
}
