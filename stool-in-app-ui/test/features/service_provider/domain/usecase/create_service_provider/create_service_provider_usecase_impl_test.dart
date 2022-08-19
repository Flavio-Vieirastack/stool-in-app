import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/create_and_update_service_provider_entity.dart';
import 'package:stool_in/features/service_provider/domain/entity/service_provider/service_provider_return_entity.dart';
import 'package:stool_in/features/service_provider/domain/error/create_service_provider_error.dart';
import 'package:stool_in/features/service_provider/domain/repository/create_service_provider/create_service_provider_repository.dart';
import 'package:stool_in/features/service_provider/domain/usecase/create_service_provider/create_service_provider_usecase.dart';
import 'package:stool_in/features/service_provider/domain/usecase/create_service_provider/create_service_provider_usecase_impl.dart';

class CreateServiceProviderrepositoryMock extends Mock
    implements CreateServiceProviderRepository {}

class CreateServiceProviderEntityMock extends Mock
    implements CreateAndUpdateServiceProviderEntity {}

class ServiceProviderReturnEntityMock extends Mock
    implements ServiceProviderReturnEntity {}

class UserDataEntityMock extends Mock implements UserDataEntity {}

void main() {
  late CreateServiceProviderrepositoryMock createServiceProviderrepositoryMock;
  late CreateServiceProviderEntityMock createServiceProviderEntityMock;
  late ServiceProviderReturnEntityMock serviceProviderReturnEntityMock;
  late CreateServiceProviderUsecase createServiceProviderUsecase;
  late UserDataEntityMock userDataEntityMock;
  setUp(() {
    createServiceProviderEntityMock = CreateServiceProviderEntityMock();
    createServiceProviderrepositoryMock = CreateServiceProviderrepositoryMock();
    serviceProviderReturnEntityMock = ServiceProviderReturnEntityMock();
    userDataEntityMock = UserDataEntityMock();
    createServiceProviderUsecase = CreateServiceProviderUsecaseImpl(
      createServiceProviderRepository: createServiceProviderrepositoryMock,
    );
  });

  group('Create serviceProvider', () {
    test('Deve retornar a entidade correta ao criar um service provider',
        () async {
      when(
        () => createServiceProviderrepositoryMock.createServiceProvider(
            createAndUpdateServiceProviderEntity:
                createServiceProviderEntityMock),
      ).thenAnswer((_) async => Right(serviceProviderReturnEntityMock));
      final sut = await createServiceProviderUsecase.createServiceProvider(
          createAndUpdateServiceProviderEntity:
              createServiceProviderEntityMock);
      expect(sut, Right(serviceProviderReturnEntityMock));
    });
    test('Deve chamar o repository correto ao criar um service provider',
        () async {
      when(
        () => createServiceProviderrepositoryMock.createServiceProvider(
            createAndUpdateServiceProviderEntity:
                createServiceProviderEntityMock),
      ).thenAnswer((_) async => Right(serviceProviderReturnEntityMock));
      final sut = await createServiceProviderUsecase.createServiceProvider(
          createAndUpdateServiceProviderEntity:
              createServiceProviderEntityMock);
      expect(sut, Right(serviceProviderReturnEntityMock));
      verify(
        () => createServiceProviderrepositoryMock.createServiceProvider(
            createAndUpdateServiceProviderEntity:
                createServiceProviderEntityMock),
      ).called(1);
    });
    test('Deve retornar um erro do tipo correto ao criar um service provider',
        () async {
      when(
        () => createServiceProviderrepositoryMock.createServiceProvider(
            createAndUpdateServiceProviderEntity:
                createServiceProviderEntityMock),
      ).thenAnswer(
          (_) async => Left(CreateServiceProviderError(message: 'message')));
      final sut = await createServiceProviderUsecase.createServiceProvider(
          createAndUpdateServiceProviderEntity:
              createServiceProviderEntityMock);
      expect(sut, Left(CreateServiceProviderError(message: 'message')));
    });
  });

  group('Update serviceProvider id no user data', () {
    test('Deve retornar o tipo void ao fazer update no user data', () async {
      when(
        () =>
            createServiceProviderrepositoryMock.sendServiceProviderIdToUserData(
                serviceProviderId: userDataEntityMock),
      ).thenAnswer((_) async => const Right(null));
      final sut =
          await createServiceProviderUsecase.sendServiceProviderIdToUserData(
              serviceProviderId: userDataEntityMock);
      expect(sut, const Right(null));
    });
    test('Deve chamar o repository correto ao fazer update no user data',
        () async {
      when(
        () =>
            createServiceProviderrepositoryMock.sendServiceProviderIdToUserData(
                serviceProviderId: userDataEntityMock),
      ).thenAnswer((_) async => const Right(null));
      final sut =
          await createServiceProviderUsecase.sendServiceProviderIdToUserData(
              serviceProviderId: userDataEntityMock);
      expect(sut, const Right(null));
      verify(
        () =>
            createServiceProviderrepositoryMock.sendServiceProviderIdToUserData(
                serviceProviderId: userDataEntityMock),
      ).called(1);
    });
    test('Deve retornar um erro correto ao fazer update no user data',
        () async {
      when(
        () =>
            createServiceProviderrepositoryMock.sendServiceProviderIdToUserData(
                serviceProviderId: userDataEntityMock),
      ).thenAnswer(
          (_) async => Left(CreateServiceProviderError(message: 'message')));
      final sut =
          await createServiceProviderUsecase.sendServiceProviderIdToUserData(
              serviceProviderId: userDataEntityMock);
      expect(sut, Left(CreateServiceProviderError(message: 'message')));
    });
  });
}
