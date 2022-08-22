import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/home/data/datasource/service_provider/service_provider_datasource.dart';
import 'package:stool_in/features/home/data/repository/service_provider/service_provider_repository_impl.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/get_service_providers_params.dart';
import 'package:stool_in/features/home/domain/entity/service_provider/service_provider_entity.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:stool_in/features/home/domain/repository/service_provider/service_provider_repository.dart';

class ServiceProviderRepositoryMock extends Mock
    implements GetServiceProviderRepository {}

class ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {}

class ServiceProviderDataSourceMock extends Mock
    implements GetServiceProviderDatasource {}

void main() {
  late ServiceProviderRepositoryMock serviceProviderrepositoryMock;
  late List<ServiceProviderEntityMock> serviceProviderEntityMock;
  late ServiceProviderDataSourceMock serviceProviderDatasourceMock;
  late GetServiceProviderRepositoryImpl serviceProviderRepositoryImpl;
  late GetServiceProvidersParams params;
  setUp(
    () {
      params = GetServiceProvidersParams(
          pageQuantity: 5,
          currentUserLocationLatitude: 50.0,
          currentUserLocationLongitude: 50.0);
      serviceProviderrepositoryMock = ServiceProviderRepositoryMock();
      serviceProviderEntityMock = [ServiceProviderEntityMock()];
      serviceProviderDatasourceMock = ServiceProviderDataSourceMock();
      serviceProviderRepositoryImpl = GetServiceProviderRepositoryImpl(
          serviceProviderDatasource: serviceProviderDatasourceMock);
    },
  );
  test('Deve retornar uma entidade corretamente', () async {
    when(
      () => serviceProviderrepositoryMock.call(providersParams: params),
    ).thenAnswer((_) async => Right(serviceProviderEntityMock));
    final sut =
        await serviceProviderrepositoryMock.call(providersParams: params);
    expect(
      sut,
      Right(serviceProviderEntityMock),
    );
  });
  test('Deve retornar um erro da instância correta', () async {
    when(
      () => serviceProviderrepositoryMock.call(providersParams: params),
    ).thenAnswer((_) async => Left(ServiceProviderError(message: 'message')));
    final sut = serviceProviderrepositoryMock.call;
    expect(
      await sut(providersParams: params),
      Left(
        ServiceProviderError(message: 'message'),
      ),
    );
  });
  test('Deve chamar o datasource corretamente', () async {
    when(
      () => serviceProviderDatasourceMock.call(providersParams: params),
    ).thenAnswer((_) async => serviceProviderEntityMock);
    final sut =
        await serviceProviderRepositoryImpl.call(providersParams: params);
    expect(sut, Right(serviceProviderEntityMock));
    verify(
      () => serviceProviderDatasourceMock.call(providersParams: params),
    ).called(1);
  });
}
