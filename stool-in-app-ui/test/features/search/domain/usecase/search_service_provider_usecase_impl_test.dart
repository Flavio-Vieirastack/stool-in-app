import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';

class _SearchServiceProviderRepositoryMock extends Mock
    implements SearchServiceProviderRepository {}

class _EntityMock extends Mock implements SearchServiceProviderQueryEntity {}

class _ServiceProviderEntityMock extends Mock implements ServiceProviderEntity {
}

void main() {
  late _SearchServiceProviderRepositoryMock searchServiceProviderRepositoryMock;
  late SerarchServiceProviderUsecase serarchServiceProviderUsecase;
  late _EntityMock entityMock;
  late List<_ServiceProviderEntityMock> serviceProviderEntityMock;
  setUp(() {
    searchServiceProviderRepositoryMock =
        _SearchServiceProviderRepositoryMock();
    serviceProviderEntityMock = [_ServiceProviderEntityMock()];
    serarchServiceProviderUsecase = SearchServiceProviderUsecaseImpl(
        searchServiceProviderRepository: searchServiceProviderRepositoryMock);
    entityMock = _EntityMock();
  });

  test('Deve retornar uma lista de service providers ao fazer pesquisa',
      () async {
    when(
      () => searchServiceProviderRepositoryMock.call(
          searchServiceProviderQueryEntity: entityMock),
    ).thenAnswer((_) async => Right(serviceProviderEntityMock));
    final sut = await serarchServiceProviderUsecase.call(
        searchServiceProviderQueryEntity: entityMock);
    expect(sut, Right(serviceProviderEntityMock));
  });
  test('Deve chamar o repository ao retornar uma lista de service providers ao fazer pesquisa',
      () async {
    when(
      () => searchServiceProviderRepositoryMock.call(
          searchServiceProviderQueryEntity: entityMock),
    ).thenAnswer((_) async => Right(serviceProviderEntityMock));
    final sut = await serarchServiceProviderUsecase.call(
        searchServiceProviderQueryEntity: entityMock);
    expect(sut, Right(serviceProviderEntityMock));
    verify(
      () => searchServiceProviderRepositoryMock.call(
          searchServiceProviderQueryEntity: entityMock),
    ).called(1);
  });
  test('Deve retornar um erro ao tentar buscar uma lista de service providers ao fazer pesquisa',
      () async {
    when(
      () => searchServiceProviderRepositoryMock.call(
          searchServiceProviderQueryEntity: entityMock),
    ).thenAnswer((_) async => Left(SearchServiceProviderError(message: '')));
    final sut = await serarchServiceProviderUsecase.call(
        searchServiceProviderQueryEntity: entityMock);
    expect(sut, Left(SearchServiceProviderError(message: '')));
   
  });
}
