import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/info/export/info_export.dart';


class _DoubtsDatasourceMock extends Mock implements DoubtsDatasource {}

class _InfoEntityMock extends Mock implements InfoEntity {}

void main() {
  late _DoubtsDatasourceMock doubtsDatasourceMock;
  late List<_InfoEntityMock> infoEntiyMock;
  late DoubtRepository doubtRepository;
  setUp(() {
    doubtsDatasourceMock = _DoubtsDatasourceMock();
    infoEntiyMock = [_InfoEntityMock()];
    doubtRepository =
        DoubtsRepositoryImpl(doubtsDatasource: doubtsDatasourceMock);
  });
  test('deve retornar a entidade correta para duvidas', () async {
    when(
      () => doubtsDatasourceMock.getDoubts(),
    ).thenAnswer((_) async => infoEntiyMock);
    final sut = await doubtRepository.getDoubts();
    expect(sut, Right(infoEntiyMock));
  });
  test('deve retornar um erro do tipo correto', () async {
    when(
      () => doubtsDatasourceMock.getDoubts(),
    ).thenThrow(InfoError(message: 'message'));
    final sut = await doubtRepository.getDoubts();
    expect(sut, Left(InfoError(message: 'message')));
  });
  test('deve chamar o datasource corretamente para duvidas', () async {
    when(
      () => doubtsDatasourceMock.getDoubts(),
    ).thenAnswer((_) async => infoEntiyMock);
    final sut = await doubtRepository.getDoubts();
    expect(sut, Right(infoEntiyMock));
    verify(
      () => doubtsDatasourceMock.getDoubts(),
    ).called(1);
  });
}
