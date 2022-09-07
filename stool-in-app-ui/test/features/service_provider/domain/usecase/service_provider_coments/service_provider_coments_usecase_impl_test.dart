import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


class _ComentsRepositoryMock extends Mock
    implements ServiceProviderComentsRepository {}

class _ComentsEntityMock extends Mock implements ComentsEntity {}

void main() {
  late _ComentsRepositoryMock comentsRepositoryMock;
  late ServiceProviderComentsUsecase serviceProviderComentsUsecase;
  late _ComentsEntityMock comentsEntityMock;
  late List<_ComentsEntityMock> comentsListMock;
  setUp(() {
    comentsRepositoryMock = _ComentsRepositoryMock();
    comentsEntityMock = _ComentsEntityMock();
    comentsListMock = [_ComentsEntityMock()];
    serviceProviderComentsUsecase = ServiceProviderComentsUsecaseImpl(
        serviceProviderComentsRepository: comentsRepositoryMock);
  });
  group('createComent', () {
    test('Deve retornar void ao criar um comentario', () async {
      when(
        () => comentsRepositoryMock.createComent(
            comentsEntity: comentsEntityMock, serviceProviderId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await serviceProviderComentsUsecase.createComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, const Right(null));
    });
    test('Deve chamar o repository e retornar void ao criar um comentario',
        () async {
      when(
        () => comentsRepositoryMock.createComent(
            comentsEntity: comentsEntityMock, serviceProviderId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await serviceProviderComentsUsecase.createComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, const Right(null));
      verify(
        () => comentsRepositoryMock.createComent(
            comentsEntity: comentsEntityMock, serviceProviderId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao criar um comentario', () async {
      when(
        () => comentsRepositoryMock.createComent(
            comentsEntity: comentsEntityMock, serviceProviderId: 1),
      ).thenAnswer((_) async => Left(ComentsError(message: 'message')));
      final sut = await serviceProviderComentsUsecase.createComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });

  group('deleteComent', () {
    test('Deve retornar void ao deletar com comentario', () async {
      when(
        () => comentsRepositoryMock.deleteComent(comentId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await serviceProviderComentsUsecase.deleteComent(comentId: 1);
      expect(sut, const Right(null));
    });
    test('Deve chamar o repository ao retornar void ao deletar com comentario',
        () async {
      when(
        () => comentsRepositoryMock.deleteComent(comentId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await serviceProviderComentsUsecase.deleteComent(comentId: 1);
      expect(sut, const Right(null));
      verify(
        () => comentsRepositoryMock.deleteComent(comentId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao deletar com comentario', () async {
      when(
        () => comentsRepositoryMock.deleteComent(comentId: 1),
      ).thenAnswer((_) async => Left(ComentsError(message: 'message')));
      final sut = await serviceProviderComentsUsecase.deleteComent(comentId: 1);
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });

  group('getAllMyComents', () {
    test('Deve retornar uma lista de comentarios', () async {
      when(
        () => comentsRepositoryMock.getAllMyComents(),
      ).thenAnswer((_) async => Right(comentsListMock));
      final sut = await serviceProviderComentsUsecase.getAllMyComents();
      expect(sut, Right(comentsListMock));
    });
    test('Deve chamar o repository ao retornar uma lista de comentarios',
        () async {
      when(
        () => comentsRepositoryMock.getAllMyComents(),
      ).thenAnswer((_) async => Right(comentsListMock));
      final sut = await serviceProviderComentsUsecase.getAllMyComents();
      expect(sut, Right(comentsListMock));
      verify(
        () => comentsRepositoryMock.getAllMyComents(),
      ).called(1);
    });
    test('Deve retornar um erro ao tentar retornar uma lista de comentarios',
        () async {
      when(
        () => comentsRepositoryMock.getAllMyComents(),
      ).thenAnswer((_) async => Left(ComentsError(message: 'message')));
      final sut = await serviceProviderComentsUsecase.getAllMyComents();
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });

  group('getUniqueComent', () {
    test('Deve retornar uma inatância de coments entity', () async {
      when(
        () => comentsRepositoryMock.getUniqueComent(comentId: 1),
      ).thenAnswer((_) async => Right(comentsEntityMock));
      final sut =
          await serviceProviderComentsUsecase.getUniqueComent(comentId: 1);
      expect(sut, Right(comentsEntityMock));
    });
    test('Deve chamar o repository ao retornar uma instância de coments entity',
        () async {
      when(
        () => comentsRepositoryMock.getUniqueComent(comentId: 1),
      ).thenAnswer((_) async => Right(comentsEntityMock));
      final sut =
          await serviceProviderComentsUsecase.getUniqueComent(comentId: 1);
      expect(sut, Right(comentsEntityMock));
      verify(
        () => comentsRepositoryMock.getUniqueComent(comentId: 1),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao tentar retornar uma instância de coments entity',
        () async {
      when(
        () => comentsRepositoryMock.getUniqueComent(comentId: 1),
      ).thenAnswer((_) async => Left(ComentsError(message: 'message')));
      final sut =
          await serviceProviderComentsUsecase.getUniqueComent(comentId: 1);
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });

  group('updateComent', () {
    test('Deve retornar void ao fazer update de um comentario', () async {
      when(
        () => comentsRepositoryMock.updateComent(
            comentsEntity: comentsEntityMock, serviceProviderId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await serviceProviderComentsUsecase.updateComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o repository ao retornar void ao fazer update de um comentario',
        () async {
      when(
        () => comentsRepositoryMock.updateComent(
            comentsEntity: comentsEntityMock, serviceProviderId: 1),
      ).thenAnswer((_) async => const Right(null));
      final sut = await serviceProviderComentsUsecase.updateComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, const Right(null));
      verify(
        () => comentsRepositoryMock.updateComent(
            comentsEntity: comentsEntityMock, serviceProviderId: 1),
      ).called(1);
    });
    test('Deve retornar um erro ao fazer update de um comentario', () async {
      when(
        () => comentsRepositoryMock.updateComent(
            comentsEntity: comentsEntityMock, serviceProviderId: 1),
      ).thenAnswer((_) async => Left(ComentsError(message: 'message')));
      final sut = await serviceProviderComentsUsecase.updateComent(
          comentsEntity: comentsEntityMock, serviceProviderId: 1);
      expect(sut, Left(ComentsError(message: 'message')));
    });
  });
}
