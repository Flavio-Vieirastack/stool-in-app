import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_app_ui/features/home/data/model/service_provider_model.dart';

import '../../../../mock/service_provider_payload.dart';

void main() {
  late double distance;
  setUp(
    () => distance = 50.0,
  );
  test('Deve retornar o id corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    expect(model[0].id, 1);
  });
  test('Deve retornar a descrição corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    expect(model[0].serviceProviderDescription,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s");
  });
  test('Deve retornar o status corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    expect(model[0].status, "ATIVO");
  });
  test('Deve retornar o o horario inicial corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    expect(model[0].initialDisponibleTime, "06:00");
  });
  test('Deve retornar o o horario final corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    expect(model[0].endDisponibleTime, "17:30");
  });
  test('Deve retornar o os dias da semana corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    expect(model[0].disponibleDays, "segunda a sexta");
  });
  test('Deve retornar a data de criação corretamente em date time', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    expect(model[0].createdAt, DateTime.parse("2022-08-08 15:44:02.468Z"));
  });
  test('Deve retornar o user data id corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    expect(model[0].userDataId, 1);
  });
  test('Deve retornar o id do execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].id, 1);
  });
  test('Deve retornar o service name do execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].serviceName, "Serviço x");
  });
  test('Deve retornar o preço no execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].price, 50);
  });
  test('Deve retornar as horas no execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].estimatedHours, 1);
  });
  test('Deve retornar service provider id no execution services corretamente',
      () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].serviceProviderId, 1);
  });
  test('Deve retornar o id no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].id, 1);
  });
  test('Deve retornar o serviceDescription no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].serviceDescription, "Preciso de concerto no guarda roupa");
  });
  test('Deve retornar o serviceDate no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].serviceDate, DateTime.parse('2022-08-09 10:40:25.397291'));
  });
  test('Deve retornar o serviceHour no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].serviceHour, DateTime.parse('2022-08-09 10:40:25.397291'));
  });
  test('Deve retornar o userComent no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userComent, 'Chegar pontualmente');
  });
  test('Deve retornar o status no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].status, 'ATIVO');
  });
  test('Deve retornar o userName no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userName, 'Flavio emerson');
  });
  test('Deve retornar o userPhotoUrl no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userPhotoUrl, 'url');
  });
  test('Deve retornar o userFirebasePushToken no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userFirebasePushToken, 'Token');
  });
  test('Deve retornar o userFirebaseUuid no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userFirebaseUuid, 'uuid');
  });
  test('Deve retornar o userLocationLatitude no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userLocationLatitude, 245789);
  });
  test('Deve retornar o userLocationaLogintude no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userLocationLongintude, 54879);
  });
  test('Deve retornar o street no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].street, 'Rua x');
  });
  test('Deve retornar o City no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].city, 'crato');
  });
  test('Deve retornar o houseNumber no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].houseNumber, '255');
  });
  test('Deve retornar o district no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].district, 'Pinto madeira');
  });
  test('Deve retornar o district no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].district, 'Pinto madeira');
  });
  test('Deve retornar o cep no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].cep, '63101220');
  });
  test('Deve retornar o referencePoint no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].referencePoint, 'Próximo ao colegio');
  });
  test('Deve retornar o servicesToDo no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].servicesTodo,
        'Montar guarda roupa, montar mesa, montar armário de cozinha');
  });
  test('Deve retornar o total no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].total, 255);
  });
  test('Deve retornar o serviceProviderId no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].serviceProviderId, 1);
  });
  test('Deve retornar o userDataId no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userDataId, 1);
  });
  test('Deve retornar o userDataId no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].id, 1);
  });
  test('Deve retornar o coment no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].coment, 'Comentário x');
  });
  test('Deve retornar o userName no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].userName, 'flavio');
  });
  test('Deve retornar o userPhotoUrl no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].userPhotoUrl, 'Photo');
  });
  test('Deve retornar o vote no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].vote, 3);
  });
  test('Deve retornar o serviceExecuted no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].servicesExecuted, 'Montagem de guard roupa');
  });
  test('Deve retornar o serviceProviderId no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].serviceProviderId, 1);
  });
  test('Deve retornar o userName no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.userName, 'Flavio emerson 5689');
  });
  test('Deve retornar o userPhotoUrl no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.userPhotoUrl,
        'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png');
  });
  test('Deve retornar o userFirebasePushToken no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.userFirebasePushToken, 'push');
  });
  test('Deve retornar o userFirebaseUuid no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.userFirebaseUuid, 'UUid');
  });
  test('Deve retornar o userLocationLatitude no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.userLocationLatitude, 2565);
  });
  test('Deve retornar o userLocationaLogintude no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.userLocationLongitude, 58741);
  });
  test('Deve retornar o street no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.street, 'Rua monsenhor esmeraldo');
  });
  test('Deve retornar o City no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.city, 'crato');
  });
  test('Deve retornar o houseNumber no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.houseNumber, '255');
  });
  test('Deve retornar o district no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.district, 'Pinto madeira');
  });
  test('Deve retornar o cep no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.cep, '63101220');
  });
  test('Deve retornar o referencePoint no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.referencePoint, 'Próximo a x');
  });
  test('Deve retornar o userState no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromMap(e, distance: distance))
        .toList();
    final sut = model[0].userData;
    expect(sut.userState, 'CE');
  });
}
