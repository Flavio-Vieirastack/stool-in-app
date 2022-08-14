import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/helpers/delayed_helper/delayed_helper.dart';

void main() {
  test('Deve executar a função no tempo correto', () async {
    final sut = DelayedHelper.delay(seconds: 1, function: () => true);
    await Future.delayed(const Duration(seconds: 1));
    expect(sut, isNotNull);
  });
}
