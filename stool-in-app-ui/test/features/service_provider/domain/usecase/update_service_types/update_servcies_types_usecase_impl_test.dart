import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


class _UpdateServiceTypeRepositoryMock extends Mock
    implements UpdateServiceTypesRepository {}

class _CreateServiceTypeEntityMock extends Mock
    implements CreateServiceTypesEntity {}

void main() {
  late _UpdateServiceTypeRepositoryMock updateServiceTypeRepositoryMock;
  late _CreateServiceTypeEntityMock createServiceTypeEntityMock;
  late UpdateServiceTypesUsecase updateServiceTypesUsecase;
  setUp(() {
    updateServiceTypeRepositoryMock = _UpdateServiceTypeRepositoryMock();
    createServiceTypeEntityMock = _CreateServiceTypeEntityMock();
    updateServiceTypesUsecase = UpdateServciesTypesUsecaseImpl(
        updateServiceTypesRepository: updateServiceTypeRepositoryMock);
  });
  test('Deve retornar void ao fazer update do service type com sucesso',
      () async {
    when(
      () => updateServiceTypeRepositoryMock.call(
          createServiceTypesEntity: createServiceTypeEntityMock),
    ).thenAnswer((_) async => const Right(null));
    final sut = await updateServiceTypesUsecase.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, const Right(null));
  });
  test(
      'Deve chamar o repository ao retornar void ao fazer update do service type com sucesso',
      () async {
    when(
      () => updateServiceTypeRepositoryMock.call(
          createServiceTypesEntity: createServiceTypeEntityMock),
    ).thenAnswer((_) async => const Right(null));
    final sut = await updateServiceTypesUsecase.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, const Right(null));
    verify(
      () => updateServiceTypeRepositoryMock.call(
          createServiceTypesEntity: createServiceTypeEntityMock),
    ).called(1);
  });
  test('Deve retornar um erro ao fazer update do service type com sucesso',
      () async {
    when(
      () => updateServiceTypeRepositoryMock.call(
          createServiceTypesEntity: createServiceTypeEntityMock),
    ).thenAnswer((_) async => Left(UpdateServiceTypesError(message: '')));
    final sut = await updateServiceTypesUsecase.call(
        createServiceTypesEntity: createServiceTypeEntityMock);
    expect(sut, Left(UpdateServiceTypesError(message: '')));
  });
}
