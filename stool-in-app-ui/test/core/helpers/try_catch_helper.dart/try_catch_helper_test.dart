import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_core/stool_in_core.dart';

void main() {
  test('Deve retornar um sucesso', () async {
    final test = TryCatchHelper.makeRequest(function: () async => true);
    final sut = await test;
    expect(sut, true);
  });
  test('Deve retornar um erro', () async {
    const forceError = 'A';
    final test = TryCatchHelper.makeRequest(function: () async => int.parse(forceError), onError: () async => false);
    final sut = await test;
    expect(sut, false);
  });
}
