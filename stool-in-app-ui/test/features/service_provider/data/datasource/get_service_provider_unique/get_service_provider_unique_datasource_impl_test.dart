import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

import '../../../../../mock/service_provider_unique_payload.dart';

class _RestClientGetMock extends Mock implements RestClientGet {}

void main() {
  late _RestClientGetMock restClientGetMock;
  late GetServiceProviderUniqueDatasource getServiceProviderUniqueDatasource;
  setUp(() {
    restClientGetMock = _RestClientGetMock();
    getServiceProviderUniqueDatasource = GetServiceProviderUniqueDatasourceImpl(
        restClientGet: restClientGetMock);
  });
  test(
      'Deve retornar uma entidade correta para service provider unique no datasource',
      () async {
    when(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).thenAnswer((_) async => RestClientResponse(
        statucCode: 200, data: serviceProviderUniquePayload));
    final sut = await getServiceProviderUniqueDatasource
        .getServiceProviderUnique(serviceProviderId: 1);
    expect(sut, isA<ServiceProviderEntity>());
  });
  test(
      'Deve chamar o restclient ao retornar uma entidade correta para service provider unique no datasource',
      () async {
    when(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).thenAnswer((_) async => RestClientResponse(
        statucCode: 200, data: serviceProviderUniquePayload));
    final sut = await getServiceProviderUniqueDatasource
        .getServiceProviderUnique(serviceProviderId: 1);
    expect(sut, isA<ServiceProviderEntity>());
    verify(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).called(1);
  });
  test(
      'Deve retornar um erro correto para service provider unique no datasource',
      () async {
    when(
      () => restClientGetMock.get(path: any(named: 'path')),
    ).thenThrow(GetServiceProviderUniqueError(message: 'message'));
    final sut = getServiceProviderUniqueDatasource;
    expect(
      () async => sut.getServiceProviderUnique(serviceProviderId: 1),
      throwsA(
        isA<GetServiceProviderUniqueError>(),
      ),
    );
  });
}
