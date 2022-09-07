import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


import '../../../../../mock/categories_mock.dart';


void main() {
  test('Deve retornar o id da categoria corretamente', () {
    final data = categories.map((e) => CategoriesModel.fromMap(e)).toList();
    expect(data[0].id, 1);
    expect(data[0].id, isA<int>());
  });
  test('Deve retornar o nome da categoria corretamente', () {
    final data = categories.map((e) => CategoriesModel.fromMap(e)).toList();
    expect(data[0].categoryName, "Pintores");
    expect(data[0].categoryName, isA<String>());
  });
  test('Deve retornar a lottie da categoria corretamente', () {
    final data = categories.map((e) => CategoriesModel.fromMap(e)).toList();
    expect(data[0].lottieUrl, "https://assets4.lottiefiles.com/packages/lf20_xbwgvxer.json");
    expect(data[0].lottieUrl, isA<String>());
  });
  test('Deve retornar a query da categoria corretamente', () {
    final data = categories.map((e) => CategoriesModel.fromMap(e)).toList();
    expect(data[0].searchQuery, "Seach");
    expect(data[0].searchQuery, isA<String>());
  });
}
