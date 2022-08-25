import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';
import 'package:stool_in/features/info/domain/repository/doubt/doubt_repository.dart';
import 'package:stool_in/features/info/domain/repository/rules/rules_repository.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase.dart';
import 'package:stool_in/features/info/domain/usecase/info_usecase_impl.dart';

class _DoubtRepositoryMock extends Mock implements DoubtRepository {}

class _RulesRepositoryMock extends Mock implements RulesRepository {}

class _InfoEntityMock extends Mock implements InfoEntity {}

void main() {
  late _DoubtRepositoryMock doubtRepositoryMock;
  late _RulesRepositoryMock rulesRepositoryMock;
  late List<_InfoEntityMock> infoEntityMock;
  late InfoUsecase infoUsecase;
  setUp(() {
    doubtRepositoryMock = _DoubtRepositoryMock();
    rulesRepositoryMock = _RulesRepositoryMock();
    infoUsecase = InfoUsecaseImpl(
      rulesRepository: rulesRepositoryMock,
      doubtRepository: doubtRepositoryMock,
    );
    infoEntityMock = [
      _InfoEntityMock(),
    ];
  });
  group('doubts tests', () {
    test('Deve retornar uma entidade de info', () async {
      when(
        () => doubtRepositoryMock.getDoubts(),
      ).thenAnswer((_) async => Right(infoEntityMock));
      final sut = await infoUsecase.getDoubts();
      expect(sut, Right(infoEntityMock));
    });
    test('Deve chamar o repository corretamente', () async {
      when(
        () => doubtRepositoryMock.getDoubts(),
      ).thenAnswer((_) async => Right(infoEntityMock));
      final sut = await infoUsecase.getDoubts();
      expect(sut, Right(infoEntityMock));
      verify(
        () => doubtRepositoryMock.getDoubts(),
      ).called(1);
    });
    test('Deve retornar um erro do tipo esperado corretamente', () async {
      when(
        () => doubtRepositoryMock.getDoubts(),
      ).thenAnswer((_) async => Left(InfoError(message: 'message')));
      final sut = await infoUsecase.getDoubts();
      expect(sut, Left(InfoError(message: 'message')));
    });
  });

  group('Rules tests', () {
    test('Deve retornar a entidade correta esperada', () async {
      when(
        () => rulesRepositoryMock.getRules(),
      ).thenAnswer((_) async => Right(infoEntityMock));
      final sut = await infoUsecase.getRules();
      expect(sut, Right(infoEntityMock));
    });
    test('Deve chamar o repository corrertamente', () async {
      when(
        () => rulesRepositoryMock.getRules(),
      ).thenAnswer((_) async => Right(infoEntityMock));
      final sut = await infoUsecase.getRules();
      expect(sut, Right(infoEntityMock));
      verify(
        () => rulesRepositoryMock.getRules(),
      ).called(1);
    });
    test('Deve retornar um erro corretamente', () async {
      when(
        () => rulesRepositoryMock.getRules(),
      ).thenAnswer((_) async => Left(InfoError(message: 'message')));
      final sut = await infoUsecase.getRules();
      expect(sut, Left(InfoError(message: 'message')));
      
    });
  });
}
