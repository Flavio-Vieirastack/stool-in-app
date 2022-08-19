import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/service_provider/data/datasource/create_service_provider/create_service_provider_datasource.dart';
import 'package:stool_in/features/service_provider/data/model/create_service_provider/create_and_update_service_provider_model.dart';
import 'package:stool_in/features/service_provider/data/repository/create_service_provider/create_service_provider_repository_impl.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/service_provider_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_provider_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/create_service_provider/create_service_provider_repository.dart';

class CreateServiceProviderDatasourceMock extends Mock
    implements CreateServiceProviderDatasource {}

class ServiceProviderReturnEntityMock extends Mock
    implements ServiceProviderReturnEntity {}

class UserDataEntityMock extends Mock implements UserDataEntity {}

class CreateServiceProviderEntityMock extends Mock
    implements CreateAndUpdateServiceProviderEntity {}

void main() {
  late CreateServiceProviderDatasourceMock createServiceProviderDatasourceMock;

  late ServiceProviderReturnEntityMock serviceProviderReturnEntityMock;
  late CreateServiceProviderEntityMock createServiceProviderEntityMock;
  late CreateServiceProviderRepository createServiceProviderRepository;
  setUpAll(() {
    createServiceProviderDatasourceMock = CreateServiceProviderDatasourceMock();
    serviceProviderReturnEntityMock = ServiceProviderReturnEntityMock();
    createServiceProviderEntityMock = CreateServiceProviderEntityMock();
    createServiceProviderRepository = CreateServiceProviderRepositoryImpl(
        createServiceProviderDatasource: createServiceProviderDatasourceMock);
    registerFallbackValue(
      CreateAndUpdateServiceProviderModel.fromEntity(
        createAndUpdateServiceProviderEntity: createServiceProviderEntityMock,
      ),
    );
  });
  group('Create serviceprovider', () {
    test(
      'Deve retornar um serviceprovider return entity para o repository',
      () async {
        when(
          () => createServiceProviderDatasourceMock.createServiceProvider(
            createAndUpdateServiceProviderModel:
                CreateAndUpdateServiceProviderModel.fromEntity(
              createAndUpdateServiceProviderEntity:
                  createServiceProviderEntityMock,
            ),
          ),
        ).thenAnswer((_) async => serviceProviderReturnEntityMock);

        final sut = await createServiceProviderRepository.createServiceProvider(
            createAndUpdateServiceProviderEntity:
                createServiceProviderEntityMock);
        expect(
          sut,
          Right(serviceProviderReturnEntityMock),
        );
      },
    );
    test(
      'Deve retornar um erro entity para o repository de create service provider',
      () async {
        when(
          () => createServiceProviderDatasourceMock.createServiceProvider(
            createAndUpdateServiceProviderModel:
                CreateAndUpdateServiceProviderModel.fromEntity(
              createAndUpdateServiceProviderEntity:
                  createServiceProviderEntityMock,
            ),
          ),
        ).thenThrow(CreateServiceProviderError(
            message: 'Erro ao criar sua conta, tente mais tarde'));

        final sut = createServiceProviderRepository.createServiceProvider;
        expect(
          await sut(
              createAndUpdateServiceProviderEntity:
                  createServiceProviderEntityMock),
          Left(CreateServiceProviderError(
              message: 'Erro ao criar sua conta, tente mais tarde')),
        );
      },
    );
    test(
      'Deve chamar o datasource ao chamar o repository para create service provider',
      () async {
        when(
          () => createServiceProviderDatasourceMock.createServiceProvider(
              createAndUpdateServiceProviderModel:
                  any(named: 'createAndUpdateServiceProviderModel')),
        ).thenAnswer((_) async => serviceProviderReturnEntityMock);

        final sut = await createServiceProviderRepository.createServiceProvider(
            createAndUpdateServiceProviderEntity:
                createServiceProviderEntityMock);
        expect(
          sut,
          Right(serviceProviderReturnEntityMock),
        );
        verify(
          () => createServiceProviderDatasourceMock.createServiceProvider(
              createAndUpdateServiceProviderModel:
                  any(named: 'createAndUpdateServiceProviderModel')),
        ).called(3);
      },
    );
  });
}
