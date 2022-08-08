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
  test('Deve retornar a descrição corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    expect(model[0].serviceProviderDescription,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s");
  });
  test('Deve retornar o status corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    expect(model[0].status, "ATIVO");
  });
  test('Deve retornar o o horario inicial corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    expect(model[0].initialDisponibleTime, "06:00");
  });
  test('Deve retornar o o horario final corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    expect(model[0].endDisponibleTime, "17:30");
  });
  test('Deve retornar o os dias da semana corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    expect(model[0].disponibleDays, "segunda a sexta");
  });
  test('Deve retornar a data de criação corretamente em date time', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    expect(model[0].createdAt, DateTime.parse("2022-08-08 15:44:02.468Z"));
  });
  test('Deve retornar o user data id corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    expect(model[0].userDataId, 1);
  });
  test('Deve retornar o id do execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].id, 1);
  });
}
