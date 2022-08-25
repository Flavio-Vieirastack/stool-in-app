import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/service_provider/domain/repository/update_service_provider_repository/update_service_provider_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/update_service_provider/update_service_provider_usecase.dart';
import 'package:stool_in/features/service_provider/domain/usecase/update_service_provider/update_service_provider_usercase_impl.dart';

class _UpdateServiceProviderRepositoryMock extends Mock
    implements UpdateServiceProviderRepository {}

class _CreateAndUpdateServiceProviderEntityMock extends Mock
    implements CreateAndUpdateServiceProviderEntity {}

void main() {
  late _UpdateServiceProviderRepositoryMock updateServiceProviderRepositoryMock;
  late _CreateAndUpdateServiceProviderEntityMock
      createAndUpdateServiceProviderEntityMock;
  late UpdateServiceProviderUsecase updateServiceProviderUsecase;
  setUp(() {
    updateServiceProviderRepositoryMock = _UpdateServiceProviderRepositoryMock();
    createAndUpdateServiceProviderEntityMock =
        _CreateAndUpdateServiceProviderEntityMock();
    updateServiceProviderUsecase = UpdateServiceProviderUsecaseImpl(
        updateServiceProviderRepository: updateServiceProviderRepositoryMock);
  });
  test(
      'Deve retornar void ao chamar o usecase para dar update no service provider',
      () async {
    when(
      () => updateServiceProviderRepositoryMock.call(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock),
    ).thenAnswer((_) async => const Right(null));
    final sut = await updateServiceProviderUsecase.call(
        createAndUpdateServiceProviderEntity:
            createAndUpdateServiceProviderEntityMock);
    expect(sut, const Right(null));
  });
  test(
      'Deve chamar o repository ao retornar void quando chamar o usecase para dar update no service provider',
      () async {
    when(
      () => updateServiceProviderRepositoryMock.call(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock),
    ).thenAnswer((_) async => const Right(null));
    final sut = await updateServiceProviderUsecase.call(
        createAndUpdateServiceProviderEntity:
            createAndUpdateServiceProviderEntityMock);
    expect(sut, const Right(null));
    verify(
      () => updateServiceProviderRepositoryMock.call(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock),
    ).called(1);
  });
  test(
      'Deve retornar um erro do tipo esperado ao chamar o update servie provider',
      () async {
    when(
      () => updateServiceProviderRepositoryMock.call(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock),
    ).thenAnswer((_) async => Left(ServiceProviderError(message: '')));
    final sut = await updateServiceProviderUsecase.call(
        createAndUpdateServiceProviderEntity:
            createAndUpdateServiceProviderEntityMock);
    expect(sut, Left(ServiceProviderError(message: '')));
    
  });
}
