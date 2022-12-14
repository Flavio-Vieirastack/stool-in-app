import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../../../mock/service_provider_create_mock.dart';

void main() {
  group('to map', () {
    late Faker faker;
    setUp(() {
      faker = Faker();
    });

    test(
        'Deve retornar a descrição correta para CreateAndUpdateServiceProviderModel',
        () {
      final disponibleDays = faker.date.dateTime().toString();
      final endDisponibleDays = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      const status = "ATIVO";
      final userDescription = faker.person.random.string(10);
      final votes = faker.randomGenerator.integer(1);
      final model = CreateAndUpdateServiceProviderModel(
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleDays,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['userDescription'];
      expect(sut, userDescription);
    });
    test(
        'Deve retornar os votes corretos para CreateAndUpdateServiceProviderModel',
        () {
      final disponibleDays = faker.date.dateTime().toString();
      final endDisponibleDays = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      const status = "ATIVO";
      final userDescription = faker.person.random.string(10);
      final votes = faker.randomGenerator.integer(1);
      final model = CreateAndUpdateServiceProviderModel(
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleDays,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['votes'];
      expect(sut, votes);
      expect(sut, isA<int>());
    });
    test(
        'Deve retornar o status correto para CreateAndUpdateServiceProviderModel',
        () {
      final disponibleDays = faker.date.dateTime().toString();
      final endDisponibleDays = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      const status = "ATIVO";
      final userDescription = faker.person.random.string(10);
      final votes = faker.randomGenerator.integer(1);
      final model = CreateAndUpdateServiceProviderModel(
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleDays,
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
        'Deve retornar o initialDisponibleTime correto para CreateAndUpdateServiceProviderModel',
        () {
      final disponibleDays = faker.date.dateTime().toString();
      final endDisponibleDays = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      const status = "ATIVO";
      final userDescription = faker.person.random.string(10);
      final votes = faker.randomGenerator.integer(1);
      final model = CreateAndUpdateServiceProviderModel(
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleDays,
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
        'Deve retornar o endDisponibleTime correto para CreateAndUpdateServiceProviderModel',
        () {
      final disponibleDays = faker.date.dateTime().toString();
      final endDisponibleDays = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      const status = "ATIVO";
      final userDescription = faker.person.random.string(10);
      final votes = faker.randomGenerator.integer(1);
      final model = CreateAndUpdateServiceProviderModel(
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleDays,
        initialDisponibleTime: initialDisponibleTime,
        status: status,
        userDescription: userDescription,
        votes: votes,
      ).toMap();
      final sut = model['endDisponibleTime'];
      expect(sut, endDisponibleDays);
      expect(sut, isA<DateTime>());
    });
    test(
        'Deve retornar o disponibleDays correto para CreateAndUpdateServiceProviderModel',
        () {
      final disponibleDays = faker.date.dateTime().toString();
      final endDisponibleDays = faker.date.dateTime();
      final initialDisponibleTime = faker.date.dateTime();
      const status = "ATIVO";
      final userDescription = faker.person.random.string(10);
      final votes = faker.randomGenerator.integer(1);
      final model = CreateAndUpdateServiceProviderModel(
        disponibleDays: disponibleDays,
        endDisponibleTime: endDisponibleDays,
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

  group('From map', () {
    test('Deve retornar o valor correto para disponibleDays', () {
      final model = CreateAndUpdateServiceProviderModel.fromMap(
          serviceProviderCreateMock);
      final sut = model.disponibleDays;
      const matcher = 'segunda a sexta';
      expect(sut, matcher);
    });
    test('Deve retornar o valor correto para endDisponibleTime', () {
      final model = CreateAndUpdateServiceProviderModel.fromMap(
          serviceProviderCreateMock);
      final sut = model.endDisponibleTime;
      final matcher = DateTime.parse('2022-08-18T18:54:59.725Z');
      expect(sut, matcher);
      expect(sut, isA<DateTime>());
    });
    test('Deve retornar o valor correto para initialDisponibleTime', () {
      final model = CreateAndUpdateServiceProviderModel.fromMap(
          serviceProviderCreateMock);
      final sut = model.initialDisponibleTime;
      final matcher = DateTime.parse('2022-08-18T18:54:59.725Z');
      expect(sut, matcher);
      expect(sut, isA<DateTime>());
    });
    test('Deve retornar o valor correto para status', () {
      final model = CreateAndUpdateServiceProviderModel.fromMap(
          serviceProviderCreateMock);
      final sut = model.status;
      const matcher = 'ATIVO';
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para userDescription', () {
      final model = CreateAndUpdateServiceProviderModel.fromMap(
          serviceProviderCreateMock);
      final sut = model.userDescription;
      const matcher =
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";
      expect(sut, matcher);
      expect(sut, isA<String>());
    });
    test('Deve retornar o valor correto para votes', () {
      final model = CreateAndUpdateServiceProviderModel.fromMap(
          serviceProviderCreateMock);
      final sut = model.votes;
      const matcher = 0;
      expect(sut, matcher);
      expect(sut, isA<int>());
    });
  });
}
