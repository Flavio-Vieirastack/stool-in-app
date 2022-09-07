import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_core/stool_in_core.dart';


void main() {
  test('Deve retornar o status correto para active', () {
    const sut = ServiceStatus.active;
    const matcher = ServiceStatus.active;
    expect(sut, matcher);
  });
  test('Deve retornar o status correto para inactive', () {
    const sut = ServiceStatus.inactive;
    const matcher = ServiceStatus.inactive;
    expect(sut, matcher);
  });
}
