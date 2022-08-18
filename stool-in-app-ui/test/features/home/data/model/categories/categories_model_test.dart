import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/home/data/model/categories/categories_model.dart';

import '../../../../../mock/categories_mock.dart';

void main() {
  test('Deve retornar o id da categoria corretamente', () {
    final data = categories.map((e) => CategoriesModel.fromMap(e)).toList();
    expect(data[0].id, 1);
  });
  test('Deve retornar o nome da categoria corretamente', () {
    final data = categories.map((e) => CategoriesModel.fromMap(e)).toList();
    expect(data[0].categoryName, "Pintores");
  });
  test('Deve retornar a lottie da categoria corretamente', () {
    final data = categories.map((e) => CategoriesModel.fromMap(e)).toList();
    expect(data[0].lottieUrl, "https://assets4.lottiefiles.com/packages/lf20_xbwgvxer.json");
  });
  test('Deve retornar a query da categoria corretamente', () {
    final data = categories.map((e) => CategoriesModel.fromMap(e)).toList();
    expect(data[0].searchQuery, "Seach");
  });
}
