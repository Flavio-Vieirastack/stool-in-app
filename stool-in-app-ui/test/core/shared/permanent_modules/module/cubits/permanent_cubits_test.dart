import 'package:flutter_test/flutter_test.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/shared/permanent_modules/module/cubits/permanent_cubits.dart';

void main() {
  test('Deve retornar uma lista do tipo correto', () {
    final sut = PermanentCubits().cubits();
    expect(sut, isA<List<SingleChildWidget>>());
  });
}
