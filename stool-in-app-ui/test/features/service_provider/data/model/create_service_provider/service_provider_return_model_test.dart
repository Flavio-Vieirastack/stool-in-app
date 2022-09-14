import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../../../mock/service_provider_create_mock.dart';

void main() {
  late Faker faker;
  setUp(() {
    faker = Faker();
  });
  group('to map', () {
    
    test(
        'Deve retornar o userDescription correto para o service provider return model',
        () async {
      final id = faker.randomGenerator.integer(1);
      final votes = faker.randomGenerator.integer(1);
      final userLoginId = faker.randomGenerator.integer(1);
      final disponibleDays = faker.randomGenerator.string(5);
      final userDescription = faker.randomGenerator.string(5);
      final status = faker.randomGenerator.string(5);
      final createdAt = faker.date.dateTime();
      final endDisponibleTime = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      final model = ServiceProviderReturnModel(
        id: id,
        userLoginId: userLoginId,
        createdAt: createdAt,
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleTime,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['userDescription'];
      expect(sut, userDescription);
      expect(sut, isA<String>());
    });
    test('Deve retornar o votes correto para o service provider return model',
        () async {
      final id = faker.randomGenerator.integer(1);
      final votes = faker.randomGenerator.integer(1);
      final userLoginId = faker.randomGenerator.integer(1);
      final disponibleDays = faker.randomGenerator.string(5);
      final userDescription = faker.randomGenerator.string(5);
      final status = faker.randomGenerator.string(5);
      final createdAt = faker.date.dateTime();
      final endDisponibleTime = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      final model = ServiceProviderReturnModel(
        id: id,
        userLoginId: userLoginId,
        createdAt: createdAt,
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleTime,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['votes'];
      expect(sut, votes);
      expect(sut, isA<int>());
    });
    test('Deve retornar o status correto para o service provider return model',
        () async {
      final id = faker.randomGenerator.integer(1);
      final votes = faker.randomGenerator.integer(1);
      final userLoginId = faker.randomGenerator.integer(1);
      final disponibleDays = faker.randomGenerator.string(5);
      final userDescription = faker.randomGenerator.string(5);
      final status = faker.randomGenerator.string(5);
      final createdAt = faker.date.dateTime();
      final endDisponibleTime = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      final model = ServiceProviderReturnModel(
        id: id,
        userLoginId: userLoginId,
        createdAt: createdAt,
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleTime,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['status'];
      expect(sut, status);
      expect(sut, isA<String>());
    });
    test(
        'Deve retornar o initialDisponibleTime correto para o service provider return model',
        () async {
      final id = faker.randomGenerator.integer(1);
      final votes = faker.randomGenerator.integer(1);
      final userLoginId = faker.randomGenerator.integer(1);
      final disponibleDays = faker.randomGenerator.string(5);
      final userDescription = faker.randomGenerator.string(5);
      final status = faker.randomGenerator.string(5);
      final createdAt = faker.date.dateTime();
      final endDisponibleTime = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      final model = ServiceProviderReturnModel(
        id: id,
        userLoginId: userLoginId,
        createdAt: createdAt,
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleTime,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['initialDisponibleTime'];
      expect(sut, initialDisponibleTime);
      expect(sut, isA<DateTime>());
    });
    test(
        'Deve retornar o endDisponibleTime correto para o service provider return model',
        () async {
      final id = faker.randomGenerator.integer(1);
      final votes = faker.randomGenerator.integer(1);
      final userLoginId = faker.randomGenerator.integer(1);
      final disponibleDays = faker.randomGenerator.string(5);
      final userDescription = faker.randomGenerator.string(5);
      final status = faker.randomGenerator.string(5);
      final createdAt = faker.date.dateTime();
      final endDisponibleTime = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      final model = ServiceProviderReturnModel(
        id: id,
        userLoginId: userLoginId,
        createdAt: createdAt,
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleTime,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['endDisponibleTime'];
      expect(sut, endDisponibleTime);
      expect(sut, isA<DateTime>());
    });
    test(
        'Deve retornar o disponibleDays correto para o service provider return model',
        () async {
      final id = faker.randomGenerator.integer(1);
      final votes = faker.randomGenerator.integer(1);
      final userLoginId = faker.randomGenerator.integer(1);
      final disponibleDays = faker.randomGenerator.string(5);
      final userDescription = faker.randomGenerator.string(5);
      final status = faker.randomGenerator.string(5);
      final createdAt = faker.date.dateTime();
      final endDisponibleTime = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      final model = ServiceProviderReturnModel(
        id: id,
        userLoginId: userLoginId,
        createdAt: createdAt,
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleTime,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['disponibleDays'];
      expect(sut, disponibleDays);
      expect(sut, isA<String>());
    });
  });

  group('from Map', () {
    test(
        'deve retornar o id correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.id;
      const matcher = 1;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test(
        'deve retornar o coins correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.coins;
      const matcher = 25;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test(
        'deve retornar o createdAt correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.createdAt;
      final matcher = DateTime.parse('2022-08-18T18:54:59.725Z');
      expect(sut, matcher);
      expect(sut, isA<DateTime>());
    });
    test(
        'deve retornar o userLoginId correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.userLoginId;
      const matcher = 1;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
    test(
        'deve retornar o disponibleDays correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.disponibleDays;
      const matcher = 'segunda a sexta';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'deve retornar o endDisponibleTime correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.endDisponibleTime;
      final matcher = DateTime.parse('2022-08-18T18:54:59.725Z');
      expect(sut, matcher);
      expect(sut, isA<DateTime>());
    });
    test(
        'deve retornar o initialDisponibleTime correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.initialDisponibleTime;
      final matcher = DateTime.parse('2022-08-18T18:54:59.725Z');
      expect(sut, matcher);
      expect(sut, isA<DateTime>());
    });
    test(
        'deve retornar o status correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.status;
      const matcher = 'ATIVO';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'deve retornar o userDescription correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.userDescription;
      const matcher =
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test(
        'deve retornar o votes correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.votes;
      const matcher = 0;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
  });
}
