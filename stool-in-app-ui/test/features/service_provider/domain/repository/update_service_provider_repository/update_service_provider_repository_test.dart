import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/home/domain/error/service_provider/service_provider_error.dart';
import 'package:stool_in/features/service_provider/data/datasource/update_service_provider/update_service_provider_datasource.dart';
import 'package:stool_in/features/service_provider/data/model/create_service_provider/create_and_update_service_provider_model.dart';
import 'package:stool_in/features/service_provider/data/repository/update_service_provider/update_service_provider_repository_impl.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/service_provider/domain/repository/update_service_provider_repository/update_service_provider_repository.dart';

class UpdateServiceProviderDatasourceMock extends Mock
    implements UpdateServiceProviderDatasource {}

class CreateAndUpdateServiceProviderEntityMock extends Mock
    implements CreateAndUpdateServiceProviderEntity {}

void main() {
  late UpdateServiceProviderDatasourceMock updateServiceProviderDatasourceMock;
  late UpdateServiceProviderRepository updateServiceProviderRepository;
  late CreateAndUpdateServiceProviderEntityMock
      createAndUpdateServiceProviderEntityMock;

  setUpAll(() {
    updateServiceProviderDatasourceMock = UpdateServiceProviderDatasourceMock();
    updateServiceProviderRepository = UpdateServiceProviderRepositoryImpl(
        updateServiceProviderDatasource: updateServiceProviderDatasourceMock);
    createAndUpdateServiceProviderEntityMock =
        CreateAndUpdateServiceProviderEntityMock();
    registerFallbackValue(
      CreateAndUpdateServiceProviderModel.fromEntity(
        createAndUpdateServiceProviderEntity:
            createAndUpdateServiceProviderEntityMock,
      ),
    );
  });

  test('Deve retornar void para chamada do update service provider repository',
      () async {
    when(
      () => updateServiceProviderDatasourceMock.call(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock,
        ),
      ),
    ).thenAnswer((_) async => Future.value());
    final sut = await updateServiceProviderRepository.call(
      createAndUpdateServiceProviderEntity:
          createAndUpdateServiceProviderEntityMock,
    );
    expect(sut, const Right(null));
  });
  test(
      'Deve retornar um erro para chamada do update service provider repository',
      () async {
    when(
      () => updateServiceProviderDatasourceMock.call(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock,
        ),
      ),
    ).thenThrow(ServiceProviderError(message: 'message'));
    final sut = updateServiceProviderRepository.call;
    expect(
      await sut(
        createAndUpdateServiceProviderEntity:
            createAndUpdateServiceProviderEntityMock,
      ),
      Left(
        ServiceProviderError(message: 'message'),
      ),
    );
  });
  test(
      'Deve chamar o datasource ao retornar void para chamada do update service provider repository',
      () async {
    when(
      () => updateServiceProviderDatasourceMock.call(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              createAndUpdateServiceProviderEntityMock,
        ),
      ),
    ).thenAnswer((_) async => Future.value());
    final sut = await updateServiceProviderRepository.call(
      createAndUpdateServiceProviderEntity:
          createAndUpdateServiceProviderEntityMock,
    );
    expect(sut, const Right(null));
    verify(
      () => updateServiceProviderDatasourceMock.call(
        createAndUpdateServiceProviderModel:
            CreateAndUpdateServiceProviderModel.fromEntity(
          createAndUpdateServiceProviderEntity:
              any(named: 'createAndUpdateServiceProviderModel'),
        ),
      ),
    ).called(3);
  });
}
