import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/features/home/data/datasource/service_provider_datasource.dart';
import 'package:stool_in_app_ui/features/home/data/repository/service_provider_repository_impl.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/error/service_provider_error.dart';
import 'package:stool_in_app_ui/features/home/domain/repository/service_provider_repository.dart';

class ServiceProviderRepositoryMock extends Mock
    implements ServiceProviderRepository {}

class ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {}

class ServiceProviderDataSourceMock extends Mock
    implements ServiceProviderDatasource {}

void main() {
  late ServiceProviderRepositoryMock serviceProviderrepositoryMock;
  late List<ServiceProviderEntityMock> serviceProviderEntityMock;
  late ServiceProviderDataSourceMock serviceProviderDatasourceMock;
  late ServiceProviderRepositoryImpl serviceProviderRepositoryImpl;
  setUp(
    () {
      serviceProviderrepositoryMock = ServiceProviderRepositoryMock();
      serviceProviderEntityMock = [ServiceProviderEntityMock()];
      serviceProviderDatasourceMock = ServiceProviderDataSourceMock();
      serviceProviderRepositoryImpl = ServiceProviderRepositoryImpl(
          serviceProviderDatasource: serviceProviderDatasourceMock);
    },
  );
  test('Deve retornar uma entidade corretamente', () async {
    when(
      () => serviceProviderrepositoryMock.call(pageQuantity: 5),
    ).thenAnswer((_) async => Right(serviceProviderEntityMock));
    final sut = await serviceProviderrepositoryMock.call(pageQuantity: 5);
    expect(
      sut,
      Right(serviceProviderEntityMock),
    );
  });
  test('Deve retornar um erro da instância correta', () async {
    when(
      () => serviceProviderrepositoryMock.call(pageQuantity: 5),
    ).thenAnswer((_) async => Left(ServiceProviderError(message: 'message')));
    final sut = serviceProviderrepositoryMock.call;
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
    final sut = await serviceProviderRepositoryImpl.call(pageQuantity: 5);
    expect(sut, Right(serviceProviderEntityMock));
    verify(
      () => serviceProviderDatasourceMock.call(pageQuantity: 5),
    ).called(1);
  });
}
