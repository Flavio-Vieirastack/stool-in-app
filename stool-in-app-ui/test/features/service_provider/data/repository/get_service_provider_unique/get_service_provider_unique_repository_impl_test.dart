import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/service_provider/data/datasource/get_service_provider_unique/get_service_provider_unique_datasource.dart';
import 'package:stool_in/features/service_provider/domain/error/get_service_provider_unique_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/get_service_provider_unique/get_service_provider_unique_repository.dart';

class _UniqueDatasourceMock extends Mock
    implements GetServiceProviderUniqueDatasource {}

class _ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {
}

void main() {
  late _UniqueDatasourceMock uniqueDatasourceMock;
  late GetServiceProviderUniqueRepository getServiceProviderUniqueRepository;
  late _ServiceProviderEntityMock serviceProviderEntityMock;
  setUp(() {
    uniqueDatasourceMock = _UniqueDatasourceMock();
    getServiceProviderUniqueRepository = GetServiceProviderUniqueRepositoryImpl(
        getServiceProviderUniqueDatasource: uniqueDatasourceMock);
    serviceProviderEntityMock = _ServiceProviderEntityMock();
  });
  test('Deve retornar uma entidade corretamente para o get unique repository',
      () async {
    when(
      () => uniqueDatasourceMock.getServiceProviderUnique(serviceProviderId: 1),
    ).thenAnswer((_) async => serviceProviderEntityMock);
    final sut =
        await getServiceProviderUniqueRepository.call(serviceProviderId: 1);
    expect(sut, Right(serviceProviderEntityMock));
  });
  test(
      'Deve chamar o datasource ao retornar uma entidade corretamente para o get unique repository',
      () async {
    when(
      () => uniqueDatasourceMock.getServiceProviderUnique(serviceProviderId: 1),
    ).thenAnswer((_) async => serviceProviderEntityMock);
    final sut =
        await getServiceProviderUniqueRepository.call(serviceProviderId: 1);
    expect(sut, Right(serviceProviderEntityMock));
    verify(
      () => uniqueDatasourceMock.getServiceProviderUnique(serviceProviderId: 1),
    ).called(1);
  });
  test(
      'Deve retornar um erro corretamente para o get unique repository',
      () async {
    when(
      () => uniqueDatasourceMock.getServiceProviderUnique(serviceProviderId: 1),
    ).thenThrow(GetServiceProviderUniqueError(message: 'message'));
    final sut =
        await getServiceProviderUniqueRepository.call(serviceProviderId: 1);
    expect(sut, Left(GetServiceProviderUniqueError(message: 'message')));
  });
}
