import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';


class _ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {
}

class _ServiceProviderDataSourceMock extends Mock
    implements GetServiceProviderDatasource {}

void main() {
  late List<_ServiceProviderEntityMock> serviceProviderEntityMock;
  late _ServiceProviderDataSourceMock serviceProviderDatasourceMock;
  late GetServiceProviderRepository serviceProviderRepositoryImpl;
  late GetServiceProvidersParams params;
  setUp(
    () {
      params = GetServiceProvidersParams(
          pageQuantity: 5,
          currentUserLocationLatitude: 50.0,
          currentUserLocationLongitude: 50.0);
      serviceProviderEntityMock = [_ServiceProviderEntityMock()];
      serviceProviderDatasourceMock = _ServiceProviderDataSourceMock();
      serviceProviderRepositoryImpl = GetServiceProviderRepositoryImpl(
          serviceProviderDatasource: serviceProviderDatasourceMock);
    },
  );
  test('Deve retornar uma entidade corretamente', () async {
    when(
      () => serviceProviderDatasourceMock.call(providersParams: params),
    ).thenAnswer((_) async => serviceProviderEntityMock);
    final sut =
        await serviceProviderRepositoryImpl.call(providersParams: params);
    expect(
      sut,
      Right(serviceProviderEntityMock),
    );
  });
  test('Deve retornar um erro da instância correta', () async {
    when(
      () => serviceProviderDatasourceMock.call(providersParams: params),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut = serviceProviderRepositoryImpl.call;
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
