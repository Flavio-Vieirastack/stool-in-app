import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/info/data/datasource/doubts/doubts_datasource.dart';
import 'package:stool_in/features/info/data/repository/doubts/doubts_repository_impl.dart';
import 'package:stool_in/features/info/domain/entity/info_entity.dart';
import 'package:stool_in/features/info/domain/error/info_error.dart';
import 'package:stool_in/features/info/domain/repository/doubt/doubt_repository.dart';

class DoubtsDatasourceMock extends Mock implements DoubtsDatasource {}

class InfoEntityMock extends Mock implements InfoEntity {}

void main() {
  late DoubtsDatasourceMock doubtsDatasourceMock;
  late List<InfoEntityMock> infoEntiyMock;
  late DoubtRepository doubtRepository;
  setUp(() {
    doubtsDatasourceMock = DoubtsDatasourceMock();
    infoEntiyMock = [InfoEntityMock()];
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
