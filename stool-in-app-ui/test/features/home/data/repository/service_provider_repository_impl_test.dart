import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


class _ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {
}

class _ServiceProviderDataSourceMock extends Mock
    implements GetServiceProviderDatasource {}

void main() {
  late List<_ServiceProviderEntityMock> serviceProviderEntityMock;
  late _ServiceProviderDataSourceMock serviceProviderDatasourceMock;
  late GetServiceProviderRepository serviceProviderRepositoryImpl;
  setUp(
    () {
    
      serviceProviderEntityMock = [_ServiceProviderEntityMock()];
      serviceProviderDatasourceMock = _ServiceProviderDataSourceMock();
      serviceProviderRepositoryImpl = GetServiceProviderRepositoryImpl(
          serviceProviderDatasource: serviceProviderDatasourceMock);
    },
  );
  test('Deve retornar uma entidade corretamente', () async {
    when(
      () => serviceProviderDatasourceMock.call(pageQuantity: 5),
    ).thenAnswer((_) async => serviceProviderEntityMock);
    final sut =
        await serviceProviderRepositoryImpl.call(pageQuantity: 5);
    expect(
      sut,
      Right(serviceProviderEntityMock),
    );
  });
  test('Deve retornar um erro da instância correta', () async {
    when(
      () => serviceProviderDatasourceMock.call(pageQuantity: 5),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut = serviceProviderRepositoryImpl.call;
    expect(
      await sut(pageQuantity: 5),
      Left(
        ServiceProviderError(message: 'message'),
      ),
    );
  });
  test('Deve chamar o datasource corretamente', () async {
    when(
      () => serviceProviderDatasourceMock.call(pageQuantity: 5),
    ).thenAnswer((_) async => serviceProviderEntityMock);
    final sut =
        await serviceProviderRepositoryImpl.call(pageQuantity: 5);
    expect(sut, Right(serviceProviderEntityMock));
    verify(
      () => serviceProviderDatasourceMock.call(pageQuantity: 5),
    ).called(1);
  });
}
