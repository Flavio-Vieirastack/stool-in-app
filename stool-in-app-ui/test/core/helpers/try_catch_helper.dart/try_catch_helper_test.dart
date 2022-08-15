import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/helpers/try_catch_helper.dart/try_catch_helper.dart';

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
