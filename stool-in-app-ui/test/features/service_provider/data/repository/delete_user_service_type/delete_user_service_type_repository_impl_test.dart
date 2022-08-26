import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/service_provider/data/datasource/delete_user_service_type/delete_user_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/repository/delete_user_service_type/delete_user_service_type_repository_impl.dart';
import 'package:stool_in/features/service_provider/domain/error/delete_service_type_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/delete_user_service_type/delete_user_service_type_repository.dart';

class _DeleteUserServiceTypeDatasourceMock extends Mock
    implements DeleteUserServiceTypeDatasource {}

void main() {
  late _DeleteUserServiceTypeDatasourceMock deleteUserServiceTypeDatasourceMock;
  late DeleteUserServiceTypeRepository deleteUserServiceTypeRepository;
  setUp(() {
    deleteUserServiceTypeDatasourceMock =
        _DeleteUserServiceTypeDatasourceMock();
    deleteUserServiceTypeRepository = DeleteUserServiceTypeRepositoryImpl(
        deleteUserServiceTypeDatasource: deleteUserServiceTypeDatasourceMock);
  });
  test('Deve retornar void ao fazer delete do service type no repository',
      () async {
    when(
      () => deleteUserServiceTypeDatasourceMock.deleteUserServiceType(id: 1),
    ).thenAnswer((_) async => Future.value());
    final sut = await deleteUserServiceTypeRepository.call(id: 1);

    expect(sut, const Right(null));
  });
  test(
      'Deve chamar o datasource ao retornar void ao fazer delete do service type no repository',
      () async {
    when(
      () => deleteUserServiceTypeDatasourceMock.deleteUserServiceType(id: 1),
    ).thenAnswer((_) async => Future.value());
    final sut = await deleteUserServiceTypeRepository.call(id: 1);

    expect(sut, const Right(null));
    verify(
      () => deleteUserServiceTypeDatasourceMock.deleteUserServiceType(id: 1),
    ).called(1);
  });
  test(
      'Deve retornar um erro ao fazer delete do service type no repository',
      () async {
    when(
      () => deleteUserServiceTypeDatasourceMock.deleteUserServiceType(id: 1),
    ).thenThrow(DeleteServiceTypeError(message: 'message'));
    final sut = await deleteUserServiceTypeRepository.call(id: 1);

    expect(sut, Left(DeleteServiceTypeError(message: 'message')));
    
  });
}
