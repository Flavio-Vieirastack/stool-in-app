import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/exports/app_exports.dart';

import '../../../../../mock/coments_model_payload_mock.dart';

void main() {
  late Faker faker;
  late String coment;
  late String servicesExecuted;
  late String userName;
  late String userPhotoUrl;
  late int votes;
  setUp(() {
    faker = Faker();
    coment = faker.randomGenerator.string(10);
    servicesExecuted = faker.randomGenerator.string(10);
    userName = faker.person.name();
    userPhotoUrl = faker.image.image();
    votes = faker.randomGenerator.integer(5);
  });
  group('to-map', () {
    test(
        'Deve retornar o valor correto do to map dos coments model no campo de coment',
        () async {
      final model = ComentsModel(
        coment: coment,
        servicesExecuted: servicesExecuted,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        vote: votes,
      );
      final sut = model.coment;
      final matcher = coment;
      expect(sut, matcher);
    });
    test(
        'Deve retornar o valor correto do to map dos coments model no campo de servicesExecuted',
        () async {
      final model = ComentsModel(
        coment: coment,
        servicesExecuted: servicesExecuted,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        vote: votes,
      );
      final sut = model.servicesExecuted;
      final matcher = servicesExecuted;
      expect(sut, matcher);
    });
    test(
        'Deve retornar o valor correto do to map dos coments model no campo de userName',
        () async {
      final model = ComentsModel(
        coment: coment,
        servicesExecuted: servicesExecuted,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        vote: votes,
      );
      final sut = model.userName;
      final matcher = userName;
      expect(sut, matcher);
    });
    test(
        'Deve retornar o valor correto do to map dos coments model no campo de userPhotoUrl',
        () async {
      final model = ComentsModel(
        coment: coment,
        servicesExecuted: servicesExecuted,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        vote: votes,
      );
      final sut = model.userPhotoUrl;
      final matcher = userPhotoUrl;
      expect(sut, matcher);
    });
    test(
        'Deve retornar o valor correto do to map dos coments model no campo de vote',
        () async {
      final model = ComentsModel(
        coment: coment,
        servicesExecuted: servicesExecuted,
        userName: userName,
        userPhotoUrl: userPhotoUrl,
        vote: votes,
      );
      final sut = model.vote;
      final matcher = votes;
      expect(sut, matcher);
    });
  });
  group('from-map', () {
    test('Deve retornar o tamanho correto da lista', () async {
      final model =
          comentsModelListPayload.map((e) => ComentsModel.fromMap(e)).toList();
      final sut = model.length;
      const matcher = 26;
      expect(sut, matcher);
    });
    test(
        'Deve retornar o valor correto da lista de payloads de coments no campo de coment',
        () async {
      final model =
          comentsModelListPayload.map((e) => ComentsModel.fromMap(e)).toList();
      final sut = model[0].coment;
      const matcher = 'Bibendum enim facilisis gravida neque.';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto da lista de payloads de coments no campo de id',
        () async {
      final model =
          comentsModelListPayload.map((e) => ComentsModel.fromMap(e)).toList();
      final sut = model[0].id;
      const matcher = 27;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test(
        'Deve retornar o valor correto da lista de payloads de coments no campo de serviceProviderId',
        () async {
      final model =
          comentsModelListPayload.map((e) => ComentsModel.fromMap(e)).toList();
      final sut = model[0].serviceProviderId;
      const matcher = 2;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test(
        'Deve retornar o valor correto da lista de payloads de coments no campo de servicesExecuted',
        () async {
      final model =
          comentsModelListPayload.map((e) => ComentsModel.fromMap(e)).toList();
      final sut = model[0].servicesExecuted;
      const matcher = 'Orci a scelerisque purus semper eget duis at tellus.';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto da lista de payloads de coments no campo de userName',
        () async {
      final model =
          comentsModelListPayload.map((e) => ComentsModel.fromMap(e)).toList();
      final sut = model[0].userName;
      const matcher = 'RayBergnaum';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto da lista de payloads de coments no campo de userPhotoUrl',
        () async {
      final model =
          comentsModelListPayload.map((e) => ComentsModel.fromMap(e)).toList();
      final sut = model[0].userPhotoUrl;
      const matcher = 'https://source.unsplash.com/640x480';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o valor correto da lista de payloads de coments no campo de vote',
        () async {
      final model =
          comentsModelListPayload.map((e) => ComentsModel.fromMap(e)).toList();
      final sut = model[0].vote;
      const matcher = 2;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
  });
}
