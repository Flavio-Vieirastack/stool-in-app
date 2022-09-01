import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/home/data/model/service_provider/services_to_execute_model.dart';

import '../../../../../mock/services_to_execute_return_payload.dart';

void main() {
  late ServicesToExecuteModel model;
  setUp(() {
    model = ServicesToExecuteModel(
      serviceDescription: 'Preciso de concerto no guarda roupa',
      serviceDate: DateTime.parse('2022-08-18T18:54:59.725Z'),
      serviceHour: DateTime.parse('2022-08-18T18:54:59.725Z'),
      userComent: 'Chegar pontualmente',
      status: 'ATIVO',
      userName: 'Flavio emerson',
      userPhotoUrl: 'url',
      userFirebasePushToken: 'Token',
      userFirebaseUuid: 'uuid',
      userLocationLatitude: 245789,
      userLocationLongintude: 54879,
      street: 'Rua x',
      city: 'crato',
      userState: 'CE',
      houseNumber: '255',
      district: 'Pinto madeira',
      cep: '63101220',
      referencePoint: 'Próximo ao colegio',
      servicesTodo:
          'Montar guarda roupa, montar mesa, montar armário de cozinha',
      total: 255,
    );
  });
  group('to-map', () {
    test(
        'Deve retornar o valor correto para o model do services to execute no campo serviceDescription',
        () async {
      final sut = model.toMap()['serviceDescription'];
      const matcher = 'Preciso de concerto no guarda roupa';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo serviceDate',
        () async {
      final sut = model.toMap()['serviceDate'];
      const matcher = '2022-08-18 18:54:59.725Z';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo serviceHour',
        () async {
      final sut = model.toMap()['serviceHour'];
      const matcher = '2022-08-18 18:54:59.725Z';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo userComent',
        () async {
      final sut = model.toMap()['userComent'];
      const matcher = 'Chegar pontualmente';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo status',
        () async {
      final sut = model.toMap()['status'];
      const matcher = 'ATIVO';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo userName',
        () async {
      final sut = model.toMap()['userName'];
      const matcher = 'Flavio emerson';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo userPhotoUrl',
        () async {
      final sut = model.toMap()['userPhotoUrl'];
      const matcher = 'url';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo userFirebasePushToken',
        () async {
      final sut = model.toMap()['userFirebasePushToken'];
      const matcher = 'Token';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo userFirebaseUuid',
        () async {
      final sut = model.toMap()['userFirebaseUuid'];
      const matcher = 'uuid';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo userLocationLatitude',
        () async {
      final sut = model.toMap()['userLocationLatitude'];
      const matcher = 245789;
      expect(sut, matcher);
      expect(sut, isA<double>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo userLocationaLogintude',
        () async {
      final sut = model.toMap()['userLocationaLogintude'];
      const matcher = 54879;
      expect(sut, matcher);
      expect(sut, isA<double>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo street',
        () async {
      final sut = model.toMap()['street'];
      const matcher = 'Rua x';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo City',
        () async {
      final sut = model.toMap()['City'];
      const matcher = 'crato';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo houseNumber',
        () async {
      final sut = model.toMap()['houseNumber'];
      const matcher = '255';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo district',
        () async {
      final sut = model.toMap()['district'];
      const matcher = 'Pinto madeira';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo cep',
        () async {
      final sut = model.toMap()['cep'];
      const matcher = '63101220';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo referencePoint',
        () async {
      final sut = model.toMap()['referencePoint'];
      const matcher = 'Próximo ao colegio';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo servicesToDo',
        () async {
      final sut = model.toMap()['servicesToDo'];
      const matcher =
          'Montar guarda roupa, montar mesa, montar armário de cozinha';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo total',
        () async {
      final sut = model.toMap()['total'];
      const matcher = 255;
      expect(sut, matcher);
      expect(sut, isA<double>());
    });
    test(
        'Deve retornar o valor correto para o model do services to execute no campo userState',
        () async {
      final sut = model.toMap()['userState'];
      const matcher = 'CE';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
  });

  group('from map', () {
    test(
        'Deve retornar o valor do cep corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].cep;
      const matcher = '58628-4414';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do city corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].city;
      const matcher = 'South Lake Axelland';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do district corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].district;
      const matcher = 'Pennypack';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do houseNumber corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].houseNumber;
      const matcher = '537898';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do id corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].id;
      const matcher = 2;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test(
        'Deve retornar o valor do referencePoint corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].referencePoint;
      const matcher = 'magna';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do serviceDate corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].serviceDate;
      final matcher = DateTime.parse('1068-01-14 11:57:06.625249');
      expect(sut, matcher);
      expect(sut, isA<DateTime>());
    });
    test(
        'Deve retornar o valor do serviceDescription corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].serviceDescription;
      const matcher = 'Odio pellentesque diam volutpat commodo sed egestas.';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do serviceHour corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].serviceHour;
      final matcher = DateTime.parse('7896-08-19 17:14:14.077687');
      expect(sut, matcher);
      expect(sut, isA<DateTime>());
    });
    test(
        'Deve retornar o valor do serviceProviderId corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].serviceProviderId;
      const matcher = 1;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test(
        'Deve retornar o valor do servicesToDo corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].servicesTodo;
      const matcher = 'arcu';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do status corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].status;
      const matcher = 'ATIVO';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do street corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].street;
      const matcher = 'Kreiger Circles';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do total corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].total;
      final matcher = double.parse('7.439606659106669');
      expect(sut, matcher);
      expect(sut, isA<double>());
    });
    test(
        'Deve retornar o valor do userComent corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userComent;
      const matcher = 'Donec adipiscing tristique risus nec.';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do userDataId corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userDataId;
      const matcher = 1;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test(
        'Deve retornar o valor do userFirebasePushToken corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userFirebasePushToken;
      const matcher = 'GsFnu[TjB<';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do userFirebaseUuid corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userFirebaseUuid;
      const matcher =
          "p[1qv\\jc;OBL7!&Fr0^/qWk|]CC>KNXIi8'1cMW5^*uPp.^#b'h\"..^:UCQj)x'pp29!CSkpA<u+l3kzJ3TT7-";
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do userLocationLatitude corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userLocationLatitude;
      const matcher = 1;
      expect(sut, matcher);
      expect(sut, isA<double>());
    });
    test(
        'Deve retornar o valor do userLocationLongintude corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userLocationLongintude;
      const matcher = 4;
      expect(sut, matcher);
      expect(sut, isA<double>());
    });
    test(
        'Deve retornar o valor do userName corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userName;
      const matcher = 'Bennie Gusikowski';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do userPhotoUrl corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userPhotoUrl;
      const matcher = 'https://source.unsplash.com/640x480';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor do userState corretamente para o from map do services to execute',
        () {
      final model = servicesToExecuteReturn
          .map((e) => ServicesToExecuteModel.fromMap(e))
          .toList();
      final sut = model[0].userState;
      const matcher = 'Wisconsin';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
  });
}
