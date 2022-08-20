import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/service_provider/data/model/create_service_provider/service_provider_return_model.dart';

import '../../../../../mock/service_provider_create_mock.dart';

void main() {
  late Faker faker;
  setUp(() {
    faker = Faker();
  });
  group('from map', () {
    test('Deve retornar o id correto para o service provider return model',
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
      final sut = model['id'];
      expect(sut, id);
    });
    test(
        'Deve retornar o userLoginId correto para o service provider return model',
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
      final sut = model['userLoginId'];
      expect(sut, userLoginId);
    });
    test(
        'Deve retornar o createdAt correto para o service provider return model',
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
      final sut = model['createdAt'];
      expect(sut, createdAt);
    });
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
    });
    test(
        'deve retornar o createdAt correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.createdAt;
      final matcher = DateTime.parse('2022-08-18T18:54:59.725Z');
      expect(sut, matcher);
    });
    test(
        'deve retornar o userLoginId correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.userLoginId;
      const matcher = 1;
      expect(sut, matcher);
    });
    test(
        'deve retornar o disponibleDays correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.disponibleDays;
      const matcher = 'segunda a sexta';
      expect(sut, matcher);
    });
    test(
        'deve retornar o endDisponibleTime correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.endDisponibleTime;
      final matcher = DateTime.parse('2022-08-18T18:54:59.725Z');
      expect(sut, matcher);
    });
    test(
        'deve retornar o initialDisponibleTime correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.initialDisponibleTime;
      final matcher = DateTime.parse('2022-08-18T18:54:59.725Z');
      expect(sut, matcher);
    });
    test(
        'deve retornar o status correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.status;
      const matcher = 'ATIVO';
      expect(sut, matcher);
    });
    test(
        'deve retornar o userDescription correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.userDescription;
      const matcher = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s";
      expect(sut, matcher);
    });
    test(
        'deve retornar o votes correto para o from map do service provider return',
        () {
      final model =
          ServiceProviderReturnModel.fromMap(serviceProviderCreateMock);
      final sut = model.votes;
      const matcher = 0;
      expect(sut, matcher);
    });
  });
}
