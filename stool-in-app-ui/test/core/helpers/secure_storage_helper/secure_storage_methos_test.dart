import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/secure_storage_methos.dart';

class MockReadSecureStorage extends Mock
    implements ReadLocalSecureStorageMethodImpl {}

class MockWriteSecureStorage extends Mock
    implements WriteLocalSecureStorageMethodsImpl {}

class MockDeleteSecureStorage extends Mock
    implements RemoveLocalSecureStorageMethodsImpl {}

class MockClearSecureStorage extends Mock
    implements ClearLocalSecureStorageMethodsImpl {}

class MockContaisSecureStorage extends Mock
    implements ContainsLocalSecureStorageMethodsImpl {}

void main() {
  group('Deve retornar todos os valores salvos corretamente', () {
    late WidgetsBinding binding;
    setUp(() {
      binding = WidgetsFlutterBinding.ensureInitialized();
    });
    test('Deve ler os valores salvos corretamente', () {
      binding;
      final mock = MockReadSecureStorage();
      when(() => mock.read(key: 'key'))
          .thenAnswer((_) async => '{"key": "value"}');
      final sut = mock.read(key: 'key');
      expect(sut, isNotNull);
    });
    test('Deve escrever os valores corretamente', () {
      binding;
      final mock = MockWriteSecureStorage();
      when(() => mock.write(key: 'key', value: 'value'))
          .thenAnswer((_) async => '{"key": "value"}');
      final sut = mock.write(key: 'key', value: 'value');
      expect(sut, isNotNull);
    });

    test('Deve deletar os valores corretamente', () async {
      binding;
      final mock = MockDeleteSecureStorage();
      when(() => mock.delete(key: 'key')).thenAnswer((_) async => true);
      final sut = await mock.delete(key: 'key');
      expect(sut, true);
    });
    test('Deve deletar todos os valores corretamente', () async {
      binding;
      final mock = MockClearSecureStorage();
      when(() => mock.clearAll()).thenAnswer((_) async => true);
      final sut = await mock.clearAll();
      expect(sut, true);
    });
    test('Deve retornar o valor booleano correto quando existir um valor',
        () async {
      binding;
      final mock = MockContaisSecureStorage();
      when(() => mock.contains(key: 'key')).thenAnswer((_) async => true);
      final sut = await mock.contains(key: 'key');
      expect(sut, true);
    });
  });
}