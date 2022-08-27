import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';


class _RulesDatasourceMock extends Mock implements RulesDatasource {}

class _InfoEntityMock extends Mock implements InfoEntity {}

void main() {
  late _RulesDatasourceMock rulesDatasourceMock;
  late List<_InfoEntityMock> infoEntityMock;
  late RulesRepository rulesRepository;
  setUp(() {
    rulesDatasourceMock = _RulesDatasourceMock();
    infoEntityMock = [_InfoEntityMock()];
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
