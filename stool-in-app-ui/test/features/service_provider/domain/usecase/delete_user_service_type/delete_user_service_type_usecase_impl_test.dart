import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/service_provider/export/service_provider_export.dart';


class _DeleteUserServiceTypeRepositoryMock extends Mock
    implements DeleteUserServiceTypeRepository {}

void main() {
  late _DeleteUserServiceTypeRepositoryMock deleteUserServiceTypeRepositoryMock;
  late DeleteUserServiceTypeUsecase deleteUserServiceTypeUsecase;
  setUp(() {
    deleteUserServiceTypeRepositoryMock =
        _DeleteUserServiceTypeRepositoryMock();
    deleteUserServiceTypeUsecase = DeleteUserServiceTypeUsecaseImpl(
      deleteUserServiceTypeRepository: deleteUserServiceTypeRepositoryMock,
    );
  });
  test('Deve retornar void ao fazer delete do service type', () async {
    when(
      () => deleteUserServiceTypeRepositoryMock.call(id: 1),
    ).thenAnswer((_) async => const Right(null));
    final sut = await deleteUserServiceTypeUsecase(id: 1);
    expect(sut, const Right(null));
  });
  test('Deve chamar o repository retornar void ao fazer delete do service type',
      () async {
    when(
      () => deleteUserServiceTypeRepositoryMock.call(id: 1),
    ).thenAnswer((_) async => const Right(null));
    final sut = await deleteUserServiceTypeUsecase(id: 1);
    expect(sut, const Right(null));
    verify(
      () => deleteUserServiceTypeRepositoryMock.call(id: 1),
    ).called(1);
  });
  test('Deve retornar um erro ao fazer delete do service type',
      () async {
    when(
      () => deleteUserServiceTypeRepositoryMock.call(id: 1),
    ).thenAnswer((_) async => Left(DeleteServiceTypeError(message: '')));
    final sut = await deleteUserServiceTypeUsecase(id: 1);
    expect(sut, Left(DeleteServiceTypeError(message: '')));
    
  });
}
