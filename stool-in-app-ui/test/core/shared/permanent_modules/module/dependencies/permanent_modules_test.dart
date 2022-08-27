import 'package:flutter_test/flutter_test.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/shared/export/shared_export.dart';


void main() {
  test('Deve retornar uma lista do tipo correto', () {
    final sut = PermanentModules().dependencies();
    expect(sut, isA<List<SingleChildWidget>>());
  });
}
