import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/search/data/model/search_service_provider_model.dart';

void main() {
  test('Deve retornar o valor correto para query', () async {
    final model =
        SearchServiceProviderModel(query: 'query', pages: 'pages').toMap();
    final sut = model['search'];
    const matcher = 'query';
    expect(sut, matcher);
    expect(sut, isA<String>());
  });
  test('Deve retornar o valor correto para pages', () async {
    final model =
        SearchServiceProviderModel(query: 'query', pages: 'pages').toMap();
    final sut = model['pages'];
    const matcher = 'pages';
    expect(sut, matcher);
    expect(sut, isA<String>());
  });
}
