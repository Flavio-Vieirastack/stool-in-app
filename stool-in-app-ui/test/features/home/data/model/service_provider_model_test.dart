import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_app_ui/features/home/data/model/service_provider_model.dart';

import '../../../../mock/service_provider_payload.dart';

void main() {
  test('Deve retornar o id corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    expect(model[0].id, 1);
  });
}
