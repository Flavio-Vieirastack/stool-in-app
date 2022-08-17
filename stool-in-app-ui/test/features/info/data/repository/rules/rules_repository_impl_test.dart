import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/info/data/datasource/rules/rules_datasource.dart';
import 'package:stool_in/features/info/data/repository/rules/rules_repository_impl.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';
import 'package:stool_in/features/info/domain/repository/rules/rules_repository.dart';

class RulesDatasourceMock extends Mock implements RulesDatasource {}

class InfoEntityMock extends Mock implements InfoEntity {}

void main() {
  late RulesDatasourceMock rulesDatasourceMock;
  late List<InfoEntityMock> infoEntityMock;
  late RulesRepository rulesRepository;
  setUp(() {
    rulesDatasourceMock = RulesDatasourceMock();
    infoEntityMock = [InfoEntityMock()];
    rulesRepository = RulesRepositoryImpl(rulesDatasource: rulesDatasourceMock);
  });
  test('Deve retornar a entidade corretamente para o repository', () async {
    when(
      () => rulesDatasourceMock.getRules(),
    ).thenAnswer((_) async => infoEntityMock);
    final sut = await rulesRepository.getRules();
    expect(sut, Right(infoEntityMock));
  });
  test('Deve chamar o datasource de rules corretamente', () async {
    when(
      () => rulesDatasourceMock.getRules(),
    ).thenAnswer((_) async => infoEntityMock);
    final sut = await rulesRepository.getRules();
    expect(sut, Right(infoEntityMock));
    verify(
      () => rulesDatasourceMock.getRules(),
    ).called(1);
  });
  test('Deve retornar um erro corretamente', () async {
    when(
      () => rulesRepository.getRules(),
    ).thenThrow(InfoError(message: 'message'));
    final sut = rulesRepository.getRules;
    expect(await sut(), Left(InfoError(message: 'message')));
  });
}
