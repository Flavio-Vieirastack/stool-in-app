import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/home/export/home_export.dart';

import '../../../../mock/service_provider_payload.dart';


void main() {
  late int distance;
  setUp(
    () => distance = 50,
  );
  test('Deve retornar o id corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].id, 1);
  });
  test('Deve retornar o user login id corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].userLoginId, 1);
  });
  test('Deve retornar a descrição corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].serviceProviderDescription,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s");
  });
  test('Deve retornar o status corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].status, "ATIVO");
  });
  test('Deve retornar o o horario inicial corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].initialDisponibleTime, "06:00");
  });
  test('Deve retornar o o horario final corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].endDisponibleTime, "17:30");
  });
  test('Deve retornar o os dias da semana corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].disponibleDays, "segunda a sexta");
  });
  test('Deve retornar a data de criação corretamente em date time', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].createdAt, DateTime.parse("2022-08-15T18:27:34.106Z"));
  });
  test('Deve retornar o user data id corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    expect(model[0].userLoginId, 1);
  });
  test('Deve retornar o id do execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].id, 1);
  });
  test('Deve retornar o service name do execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].serviceName, "Serviço x");
  });
  test('Deve retornar o preço no execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].price, 50);
  });
  test('Deve retornar as horas no execution services corretamente', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].estimatedHours, 1);
  });
  test('Deve retornar service provider id no execution services corretamente',
      () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].executionServices;
    expect(sut[0].serviceProviderId, 1);
  });
  test('Deve retornar o id no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].id, 1);
  });
  test('Deve retornar o serviceDescription no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].serviceDescription, "Preciso de concerto no guarda roupa");
  });
  test('Deve retornar o serviceDate no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].serviceDate, DateTime.parse('2022-08-15 16:12:36.566044'));
  });
  test('Deve retornar o serviceHour no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].serviceHour, DateTime.parse('2022-08-15 16:12:36.620860'));
  });
  test('Deve retornar o userComent no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userComent, 'Chegar pontualmente');
  });
  test('Deve retornar o status no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].status, 'ATIVO');
  });
  test('Deve retornar o userName no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userName, 'Flavio emerson');
  });
  test('Deve retornar o userPhotoUrl no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userPhotoUrl, 'url');
  });
  test('Deve retornar o userFirebasePushToken no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userFirebasePushToken, 'Token');
  });
  test('Deve retornar o userFirebaseUuid no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userFirebaseUuid, 'uuid');
  });
  test('Deve retornar o userLocationLatitude no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userLocationLatitude, -7.2380874453854);
  });
  test('Deve retornar o userLocationaLogintude no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userLocationLongintude, -39.41323305981678);
  });
  test('Deve retornar o street no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].street, 'Rua x');
  });
  test('Deve retornar o City no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].city, 'crato');
  });
  test('Deve retornar o houseNumber no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].houseNumber, '255');
  });
  test('Deve retornar o district no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].district, 'Pinto madeira');
  });
  test('Deve retornar o district no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].district, 'Pinto madeira');
  });
  test('Deve retornar o cep no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].cep, '63101220');
  });
  test('Deve retornar o referencePoint no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].referencePoint, 'Próximo ao colegio');
  });
  test('Deve retornar o servicesToDo no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].servicesTodo,
        'Montar guarda roupa, montar mesa, montar armário de cozinha');
  });
  test('Deve retornar o total no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].total, 255);
  });
  test('Deve retornar o serviceProviderId no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].serviceProviderId, 1);
  });
  test('Deve retornar o userDataId no servicesToExecute', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].servicesToExecuteModel;
    expect(sut[0].userDataId, 1);
  });
  test('Deve retornar o userDataId no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].id, 1);
  });
  test('Deve retornar o coment no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].coment, 'Comentário x');
  });
  test('Deve retornar o userName no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].userName, 'flavio');
  });
  test('Deve retornar o userPhotoUrl no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].userPhotoUrl, 'Photo');
  });
  test('Deve retornar o vote no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].vote, 3);
  });
  test('Deve retornar o serviceExecuted no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].servicesExecuted, 'Montagem de guard roupa');
  });
  test('Deve retornar o serviceProviderId no coments', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].coments;
    expect(sut[0].serviceProviderId, 1);
  });
  test('Deve retornar o userName no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.userName).toList().first;
    expect(sut, 'Flavio emerson 5689');
  });
  test('Deve retornar o userPhotoUrl no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.userPhotoUrl).toList().first;
    expect(sut,
        'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png');
  });
  test('Deve retornar o userFirebasePushToken no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.userFirebasePushToken).toList().first;
    expect(sut, 'push');
  });
  test('Deve retornar o userFirebaseUuid no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.userFirebaseUuid).toList().first;
    expect(sut, 'UUid');
  });
  test('Deve retornar o userLocationLatitude no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.userLocationLatitude).toList().first;
    expect(sut, 2565);
  });
  test('Deve retornar o userLocationaLogintude no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.userLocationLongitude).toList().first;
    expect(sut, 58741);
  });
  test('Deve retornar o street no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.street).toList().first;
    expect(sut, 'Rua monsenhor esmeraldo');
  });
  test('Deve retornar o City no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.city).toList().first;
    expect(sut, 'crato');
  });
  test('Deve retornar o houseNumber no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.houseNumber).toList().first;
    expect(sut, '255');
  });
  test('Deve retornar o district no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.district).toList().first;
    expect(sut, 'Pinto madeira');
  });
  test('Deve retornar o cep no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.cep).toList().first;
    expect(sut, '63101220');
  });
  test('Deve retornar o referencePoint no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.referencePoint).toList().first;
    expect(sut, 'Próximo a x');
  });
  test('Deve retornar o userState no userData', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].userData.map((e) => e.userState).toList().first;
    expect(sut, 'CE');
  });
  test('Deve retornar a distância correta', () {
    final model = serviceProviderPayload
        .map((e) => ServiceProviderModel.fromDataSource(e, distance: distance))
        .toList();
    final sut = model[0].distance;
    expect(sut, 50);
  });
}
