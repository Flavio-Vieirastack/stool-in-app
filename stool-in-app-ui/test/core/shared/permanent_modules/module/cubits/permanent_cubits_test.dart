import 'package:flutter_test/flutter_test.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/exports/app_exports.dart';


void main() {
  test('Deve retornar uma lista do tipo correto', () {
    final sut = PermanentCubits().cubits();
    expect(sut, isA<List<SingleChildWidget>>());
  });
}
