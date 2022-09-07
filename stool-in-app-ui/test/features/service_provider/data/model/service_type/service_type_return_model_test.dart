import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../../../mock/service_types_return_enty_payload_mock.dart';




void main() {
  test('Deve retornar o valor correto para serviceTypeId', () {
    final model = ServiceTypeReturnModel.fromMap(servicesTypePayload);
    final sut = model.serviceTypeId;
    const matcher = 2;
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para estimatedHours', () {
    final model = ServiceTypeReturnModel.fromMap(servicesTypePayload);
    final sut = model.estimatedHours;
    const matcher = 1;
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para price', () {
    final model = ServiceTypeReturnModel.fromMap(servicesTypePayload);
    final sut = model.price;
    const matcher = 50.0;
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para serviceName', () {
    final model = ServiceTypeReturnModel.fromMap(servicesTypePayload);
    final sut = model.serviceName;
    const matcher = 'Diferente2';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para serviceProviderId', () {
    final model = ServiceTypeReturnModel.fromMap(servicesTypePayload);
    final sut = model.serviceProviderId;
    const matcher = 1;
    expect(sut, matcher);
  });
}
