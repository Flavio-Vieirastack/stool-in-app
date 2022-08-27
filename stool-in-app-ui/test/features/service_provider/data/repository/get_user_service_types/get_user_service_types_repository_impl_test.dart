import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';


class _GetUserServiceTypesDatasourceMock extends Mock
    implements GetUserServiceTypesDatasource {}

class _CreateServiceTypeEntityMock extends Mock
    implements CreateServiceTypesEntity {}

class _ServiceTypesReturnEntityMock extends Mock
    implements ServiceTypesReturnEntity {}

void main() {
  late _GetUserServiceTypesDatasourceMock getUserServiceTypesDatasourceMock;
  late List<_ServiceTypesReturnEntityMock> serviceTypesReturnEntityMock;
  late _CreateServiceTypeEntityMock createServiceTypeEntityMock;
  late GetUserServiceTypesRepository getUserServiceTypesRepository;
  setUp(() {
    getUserServiceTypesDatasourceMock = _GetUserServiceTypesDatasourceMock();
    serviceTypesReturnEntityMock = [_ServiceTypesReturnEntityMock()];
    createServiceTypeEntityMock = _CreateServiceTypeEntityMock();
    getUserServiceTypesRepository = GetUserServiceTypesRepositoryImpl(
        getUserServiceTypesDatasource: getUserServiceTypesDatasourceMock);
  });
  test(
      'Deve retornar uma lista de entidade correta ao fazer get do service types',
      () async {
    when(
      () => getUserServiceTypesDatasourceMock.getUserServicesTypes(
          serviceProviderId: createServiceTypeEntityMock),
    ).thenAnswer((_) async => serviceTypesReturnEntityMock);
    final sut = await getUserServiceTypesRepository.call(
        serviceProviderId: createServiceTypeEntityMock);
    expect(sut, Right(serviceTypesReturnEntityMock));
  });
  test(
      'Deve chamar o datasource ao retornar uma lista de entidade correta ao fazer get do service types',
      () async {
    when(
      () => getUserServiceTypesDatasourceMock.getUserServicesTypes(
          serviceProviderId: createServiceTypeEntityMock),
    ).thenAnswer((_) async => serviceTypesReturnEntityMock);
    final sut = await getUserServiceTypesRepository.call(
        serviceProviderId: createServiceTypeEntityMock);
    expect(sut, Right(serviceTypesReturnEntityMock));
    verify(
      () => getUserServiceTypesDatasourceMock.getUserServicesTypes(
          serviceProviderId: createServiceTypeEntityMock),
    ).called(1);
  });
  test('Deve um erro do tipo correto ao fazer get do service types', () async {
    when(
      () => getUserServiceTypesDatasourceMock.getUserServicesTypes(
          serviceProviderId: createServiceTypeEntityMock),
    ).thenThrow(GetUserServiceTypesError(message: 'message'));
    final sut = await getUserServiceTypesRepository.call(
        serviceProviderId: createServiceTypeEntityMock);
    expect(sut, Left(GetUserServiceTypesError(message: 'message')));
  });
}
