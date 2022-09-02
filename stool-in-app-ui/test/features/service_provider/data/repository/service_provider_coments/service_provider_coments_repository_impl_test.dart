import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/home/data/model/service_provider/coments_model.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/coments_entity.dart';
import 'package:stool_in/features/service_provider/data/datasource/service_provider_coments/service_provider_coments_datasource.dart';
import 'package:stool_in/features/service_provider/data/repository/service_provider_coments/service_provider_coments_repository_impl.dart';
import 'package:stool_in/features/service_provider/domain/error/coments_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/service_provider_coments/service_provider_coments_repository.dart';

class _ComentsDatasourceMock extends Mock
    implements ServiceProviderComentsDatasource {}

void main() {
  late _ComentsDatasourceMock comentsDatasourceMock;
  late ServiceProviderComentsRepository serviceProviderComentsRepository;
  late ComentsEntity comentsEntityMock;
  late List<ComentsEntity> comentsEntityList;
  late Faker faker;
  setUp(() {
    faker = Faker();
    comentsDatasourceMock = _ComentsDatasourceMock();
    serviceProviderComentsRepository = ServiceProviderComentsRepositoryImpl(
      serviceProviderComentsDatasource: comentsDatasourceMock,
    );
    comentsEntityMock = ComentsEntity(
        coment: faker.randomGenerator.string(5),
        servicesExecuted: faker.randomGenerator.string(5),
        userName: faker.person.name(),
        userPhotoUrl: faker.image.image(),
        vote: faker.randomGenerator.integer(5));
    comentsEntityList = [comentsEntityMock];

    registerFallbackValue(
        ComentsModel.fromEntity(comentsEntity: comentsEntityMock));
  });
  group('createComent', () {
    test('Deve retornar void ao criar um comentario', () async {
      when(
        () => comentsDatasourceMock.createComent(
            comentsModel: any(named: 'comentsModel'), serviceProviderId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut = await serviceProviderComentsRepository.createComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, const Right(null));
    });
    test('Deve chamar o datasource ao retornar void ao criar um comentario',
        () async {
      when(
        () => comentsDatasourceMock.createComent(
            comentsModel: any(named: 'comentsModel'), serviceProviderId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut = await serviceProviderComentsRepository.createComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, const Right(null));
      verify(
        () => comentsDatasourceMock.createComent(
            comentsModel: any(named: 'comentsModel'), serviceProviderId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao criar um comentario', () async {
      when(
        () => comentsDatasourceMock.createComent(
            comentsModel: any(named: 'comentsModel'), serviceProviderId: 1),
      ).thenThrow(ComentsError(message: 'message'));
      final sut = await serviceProviderComentsRepository.createComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });
  group('deleteComent', () {
    test('Deve retornar void ao fazer um delete de um comentario', () async {
      when(
        () => comentsDatasourceMock.deleteComent(comentId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut =
          await serviceProviderComentsRepository.deleteComent(comentId: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasource ao retornar void ao fazer um delete de um comentario',
        () async {
      when(
        () => comentsDatasourceMock.deleteComent(comentId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut =
          await serviceProviderComentsRepository.deleteComent(comentId: 1);
      expect(sut, const Right(null));
      verify(
        () => comentsDatasourceMock.deleteComent(comentId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao fazer um delete de um comentario', () async {
      when(
        () => comentsDatasourceMock.deleteComent(comentId: 1),
      ).thenThrow(ComentsError(message: 'message'));
      final sut =
          await serviceProviderComentsRepository.deleteComent(comentId: 1);
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });
  group('getAllMyComents', () {
    test('Deve retornar uma lista de comentarios no repository impl', () async {
      when(
        () => comentsDatasourceMock.getAllMyComents(),
      ).thenAnswer((_) async => comentsEntityList);
      final sut = await serviceProviderComentsRepository.getAllMyComents();
      expect(sut, Right(comentsEntityList));
    });
    test(
        'Deve chamar o datasource ao retornar uma lista de comentarios no repository impl',
        () async {
      when(
        () => comentsDatasourceMock.getAllMyComents(),
      ).thenAnswer((_) async => comentsEntityList);
      final sut = await serviceProviderComentsRepository.getAllMyComents();
      expect(sut, Right(comentsEntityList));
      verify(
        () => comentsDatasourceMock.getAllMyComents(),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar uma lista de comentarios no repository impl',
        () async {
      when(
        () => comentsDatasourceMock.getAllMyComents(),
      ).thenThrow(ComentsError(message: 'message'));
      final sut = await serviceProviderComentsRepository.getAllMyComents();
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });
  group('getUniqueComent', () {
    test('Deve retornar uma entidade de coments no repository impl', () async {
      when(
        () => comentsDatasourceMock.getUniqueComent(comentId: 1),
      ).thenAnswer((_) async => comentsEntityMock);
      final sut =
          await serviceProviderComentsRepository.getUniqueComent(comentId: 1);
      expect(sut, Right(comentsEntityMock));
    });
    test(
        'Deve chamar o datasource ao retornar uma entidade de coments no repository impl',
        () async {
      when(
        () => comentsDatasourceMock.getUniqueComent(comentId: 1),
      ).thenAnswer((_) async => comentsEntityMock);
      final sut =
          await serviceProviderComentsRepository.getUniqueComent(comentId: 1);
      expect(sut, Right(comentsEntityMock));
      verify(
        () => comentsDatasourceMock.getUniqueComent(comentId: 1),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar uma entidade de coments no repository impl',
        () async {
      when(
        () => comentsDatasourceMock.getUniqueComent(comentId: 1),
      ).thenThrow(ComentsError(message: 'message'));
      final sut =
          await serviceProviderComentsRepository.getUniqueComent(comentId: 1);
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });
  group('updateComent', () {
    test(
        'Deve retornar void ao fazer update de um comentario no repository impl',
        () async {
      when(
        () => comentsDatasourceMock.updateComent(
            comentsModel: any(named: 'comentsModel'), serviceProviderId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut = await serviceProviderComentsRepository.updateComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasource ao retornar void ao fazer update de um comentario no repository impl',
        () async {
      when(
        () => comentsDatasourceMock.updateComent(
            comentsModel: any(named: 'comentsModel'), serviceProviderId: 1),
      ).thenAnswer((_) async => Future.value());
      final sut = await serviceProviderComentsRepository.updateComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, const Right(null));
      verify(
        () => comentsDatasourceMock.updateComent(
            comentsModel: any(named: 'comentsModel'), serviceProviderId: 1),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar void ao fazer update de um comentario no repository impl',
        () async {
      when(
        () => comentsDatasourceMock.updateComent(
            comentsModel: any(named: 'comentsModel'), serviceProviderId: 1),
      ).thenThrow(ComentsError(message: 'message'));
      final sut = await serviceProviderComentsRepository.updateComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });
}
