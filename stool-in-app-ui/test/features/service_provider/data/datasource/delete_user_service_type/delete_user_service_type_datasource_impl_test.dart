import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/service_provider/data/datasource/delete_user_service_type/delete_user_service_type_datasource.dart';
import 'package:stool_in/features/service_provider/data/datasource/delete_user_service_type/delete_user_service_type_datasource_impl.dart';
import 'package:stool_in/features/service_provider/domain/error/delete_service_type_error.dart';

class _RestClientDeleteMock extends Mock implements RestClientDelete {}

void main() {
  late _RestClientDeleteMock restClientDeleteMock;
  late DeleteUserServiceTypeDatasource deleteUserServiceTypeDatasource;
  setUp(() {
    restClientDeleteMock = _RestClientDeleteMock();
    deleteUserServiceTypeDatasource = DeleteUserServiceTypeDatasourceImpl(
        restClientDelete: restClientDeleteMock);
  });
  test('Deve retornar void ao deletar o service type', () async {
    when(
      () => restClientDeleteMock.delete(path: any(named: 'path')),
    ).thenAnswer((_) async => RestClientResponse(data: null, statucCode: 200));
    final sut = deleteUserServiceTypeDatasource.deleteUserServiceType(id: 1);
    expect(sut, isA<Future<void>>());
  });
  test('Deve chamar o restclient ao deletar o service type', () async {
    when(
      () => restClientDeleteMock.delete(path: any(named: 'path')),
    ).thenAnswer((_) async => RestClientResponse(data: null, statucCode: 200));
    final sut = deleteUserServiceTypeDatasource.deleteUserServiceType(id: 1);
    expect(sut, isA<Future<void>>());
    verify(
      () => restClientDeleteMock.delete(path: any(named: 'path')),
    ).called(1);
  });
  test('Deve retornar um erro ao deletar o service type', () async {
    when(
      () => restClientDeleteMock.delete(path: any(named: 'path')),
    ).thenThrow(DeleteServiceTypeError(message: 'message'));
    final sut = deleteUserServiceTypeDatasource.deleteUserServiceType;
    expect(() async => sut(id: 1), throwsException);
   
  });
}
