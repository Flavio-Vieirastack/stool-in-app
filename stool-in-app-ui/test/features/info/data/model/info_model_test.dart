import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/exports/app_exports.dart';

import '../../../../mock/doubts_mock.dart';
import '../../../../mock/rules_mock.dart';


void main() {
  test('Deve retornar os valores corretamente para titulo do rules model',
      () async {
    final sut = rules.map((e) => InfoModel.fromMap(e)).toList();
    expect(sut[0].title, 'Teste');
  });
  test('Deve retornar os valores corretamente para body do rules model',
      () async {
    final sut = rules.map((e) => InfoModel.fromMap(e)).toList();
    expect(sut[0].body, 'TEste');
  });
  test('Deve retornar os valores corretamente para body de duvidas model',
      () async {
    final sut = doubts.map((e) => InfoModel.fromMap(e)).toList();
    expect(sut[0].body, 'Teste');
  });
  test('Deve retornar os valores corretamente para titulo de duvidas model',
      () async {
    final sut = doubts.map((e) => InfoModel.fromMap(e)).toList();
    expect(sut[0].title, 'Teste');
  });
}
