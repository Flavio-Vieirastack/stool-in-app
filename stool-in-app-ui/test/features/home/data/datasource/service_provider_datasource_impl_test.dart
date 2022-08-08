import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/features/home/data/datasource/service_provider_datasource.dart';
import 'package:stool_in_app_ui/features/home/domain/entity/service_provider_entity.dart';
import 'package:stool_in_app_ui/features/home/domain/error/service_provider_error.dart';

class ServiceProviderDataSourceMock extends Mock
    implements ServiceProviderDatasource {}

class ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {}

void main() {
  late ServiceProviderDataSourceMock serviceProviderDataSourceMock;
  late List<ServiceProviderEntityMock> serViceProviderEntity;
  setUp(
    () {
      serviceProviderDataSourceMock = ServiceProviderDataSourceMock();
      serViceProviderEntity = [ServiceProviderEntityMock()];
    },
  );
  test('Deve retornar uma entidade corretamente', () async {
    when(
      () => serviceProviderDataSourceMock.call(pageQuantity: 5),
    ).thenAnswer((_) async => serViceProviderEntity);
    final sut = await serviceProviderDataSourceMock.call(pageQuantity: 5);
    expect(sut, serViceProviderEntity);
  });
  test('Deve retornar um erro corretamente', () async {
    when(
      () => serviceProviderDataSourceMock.call(pageQuantity: 5),
    ).thenThrow( ServiceProviderError(message: 'message'));
    final sut = serviceProviderDataSourceMock.call;
    expect(() async => sut(pageQuantity: 5), throwsException);
  });
}
