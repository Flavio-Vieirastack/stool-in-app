import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class _SearchServiceProvidersDatasourceMock extends Mock
    implements SearchServiceProviderDatasource {}

class _ServiceProviderReturnEntityMock extends Mock
    implements ServiceProviderEntity {}

void main() {
  late _SearchServiceProvidersDatasourceMock serviceProvidersDatasourceMock;
  late SearchServiceProviderRepository searchServiceProviderRepository;
  late List<_ServiceProviderReturnEntityMock> serviceProviderEntityMockList;
  late SearchServiceProviderQueryEntity serviceProviderEntityMock;
  setUpAll(() {
    serviceProviderEntityMock =
        SearchServiceProviderQueryEntity(query: 'query', pages: 'pages');
    serviceProviderEntityMockList = [_ServiceProviderReturnEntityMock()];
    serviceProvidersDatasourceMock = _SearchServiceProvidersDatasourceMock();
    searchServiceProviderRepository = SearchServiceProviderRepositoryImpl(
        searchServiceProviderDatasource: serviceProvidersDatasourceMock);
    registerFallbackValue(SearchServiceProviderModel.fromEntity(
        searchServiceProviderQueryEntity: serviceProviderEntityMock));
  });
  test(
      'Deve retornar uma lista de service providers ao fazer search no repository impl',
      () async {
    when(
      () => serviceProvidersDatasourceMock.searchServiceProviders(
          serviceProviderModel: any(named: 'serviceProviderModel')),
    ).thenAnswer((_) async => serviceProviderEntityMockList);
    final sut = await searchServiceProviderRepository.call(
        searchServiceProviderQueryEntity: serviceProviderEntityMock);
    expect(sut, Right(serviceProviderEntityMockList));
  });
  test(
      'Deve chamar o datasource ao retornar uma lista de service providers ao fazer search no repository impl',
      () async {
    when(
      () => serviceProvidersDatasourceMock.searchServiceProviders(
          serviceProviderModel: any(named: 'serviceProviderModel')),
    ).thenAnswer((_) async => serviceProviderEntityMockList);
    final sut = await searchServiceProviderRepository.call(
        searchServiceProviderQueryEntity: serviceProviderEntityMock);
    expect(sut, Right(serviceProviderEntityMockList));
    verify(
      () => serviceProvidersDatasourceMock.searchServiceProviders(
          serviceProviderModel: any(named: 'serviceProviderModel')),
    ).called(2);
  });
  test(
      'Deve retornar um erro ao tentar retornar uma lista de service providers ao fazer search no repository impl',
      () async {
    when(
      () => serviceProvidersDatasourceMock.searchServiceProviders(
          serviceProviderModel: any(named: 'serviceProviderModel')),
    ).thenThrow(SearchServiceProviderError(message: 'message'));
    final sut = await searchServiceProviderRepository.call(
        searchServiceProviderQueryEntity: serviceProviderEntityMock);
    expect(sut, Left(SearchServiceProviderError(message: 'message')));
  });
}
