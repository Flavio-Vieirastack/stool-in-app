import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';


class _ServiceProviderRepositoryMock extends Mock
    implements GetServiceProviderRepository {}

class _ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {}

class _ServiceProviderDataSourceMock extends Mock
    implements GetServiceProviderDatasource {}

void main() {
  late _ServiceProviderRepositoryMock serviceProviderrepositoryMock;
  late List<_ServiceProviderEntityMock> serviceProviderEntityMock;
  late _ServiceProviderDataSourceMock serviceProviderDatasourceMock;
  late GetServiceProviderRepositoryImpl serviceProviderRepositoryImpl;
  late GetServiceProvidersParams params;
  setUp(
    () {
      params = GetServiceProvidersParams(
          pageQuantity: 5,
          currentUserLocationLatitude: 50.0,
          currentUserLocationLongitude: 50.0);
      serviceProviderrepositoryMock = _ServiceProviderRepositoryMock();
      serviceProviderEntityMock = [_ServiceProviderEntityMock()];
      serviceProviderDatasourceMock = _ServiceProviderDataSourceMock();
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
