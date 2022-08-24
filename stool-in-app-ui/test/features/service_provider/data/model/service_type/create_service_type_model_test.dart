import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/service_provider/data/model/service_type/create_service_type_model.dart';

void main() {
  test('Deve retornar o valor correto para estimatedHours', () async {
    final data = CreateServiceTypeModel(
      serviceProviderId: 1,
      estimatedHours: 1,
      price: 2,
      serviceName: 'teste',
    ).toMap();
    expect(data['estimatedHours'], 1);
  });
  test('Deve retornar o valor correto para price', () async {
    final data = CreateServiceTypeModel(
      serviceProviderId: 1,
      estimatedHours: 1,
      price: 2,
      serviceName: 'teste',
    ).toMap();
    expect(data['price'], 2);
  });
  test('Deve retornar o valor correto para serviceName', () async {
    final data = CreateServiceTypeModel(
      serviceProviderId: 1,
      estimatedHours: 1,
      price: 2,
      serviceName: 'teste',
    ).toMap();
    expect(data['serviceName'], 'teste');
  });
}
