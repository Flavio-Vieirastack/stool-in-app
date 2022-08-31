import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/get_service_provider_unique_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/get_service_provider_unique/get_service_provider_unique_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/get_service_provider_unique/get_service_provider_unique_usecase.dart';
import 'package:stool_in/features/service_provider/domain/usecase/get_service_provider_unique/get_service_provider_unique_usecase_impl.dart';

class _UniqueRepositoryMock extends Mock
    implements GetServiceProviderUniqueRepository {}

class _ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {
}

void main() {
  late _UniqueRepositoryMock uniqueRepositoryMock;
  late GetServiceProviderUniqueUsecase getServiceProviderUniqueUsecase;
  late _ServiceProviderEntityMock serviceProviderEntityMock;
  setUp(() {
    uniqueRepositoryMock = _UniqueRepositoryMock();
    getServiceProviderUniqueUsecase = GetServiceProviderUniqueUsecaseImpl(
        getServiceProviderUniqueRepository: uniqueRepositoryMock);
    serviceProviderEntityMock = _ServiceProviderEntityMock();
  });
  test('Deve retornar uma entidade correta para service provider unique',
      () async {
    when(
      () => uniqueRepositoryMock.call(serviceProviderId: 1),
    ).thenAnswer((_) async => Right(serviceProviderEntityMock));
    final sut =
        await getServiceProviderUniqueUsecase.call(serviceProviderId: 1);
    expect(sut, Right(serviceProviderEntityMock));
  });
  test(
      'Deve chamar o repository correto ao retornar uma entidade correta para service provider unique',
      () async {
    when(
      () => uniqueRepositoryMock.call(serviceProviderId: 1),
    ).thenAnswer((_) async => Right(serviceProviderEntityMock));
    final sut =
        await getServiceProviderUniqueUsecase.call(serviceProviderId: 1);
    expect(sut, Right(serviceProviderEntityMock));
    verify(
      () => uniqueRepositoryMock.call(serviceProviderId: 1),
    ).called(1);
  });
  test('Deve um erro correto para service provider unique', () async {
    when(
      () => uniqueRepositoryMock.call(serviceProviderId: 1),
    ).thenAnswer(
        (_) async => Left(GetServiceProviderUniqueError(message: 'message')));
    final sut =
        await getServiceProviderUniqueUsecase.call(serviceProviderId: 1);
    expect(sut, Left(GetServiceProviderUniqueError(message: 'message')));
  });
}
