import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/export/auth_exports.dart';
import 'package:stool_in/features/service_provider/export/service_provider_export.dart';


class _CreateServiceProviderrepositoryMock extends Mock
    implements CreateServiceProviderRepository {}

class _CreateServiceProviderEntityMock extends Mock
    implements CreateAndUpdateServiceProviderEntity {}

class _ServiceProviderReturnEntityMock extends Mock
    implements ServiceProviderReturnEntity {}

class _UserDataEntityMock extends Mock implements UserDataEntity {}

void main() {
  late _CreateServiceProviderrepositoryMock createServiceProviderrepositoryMock;
  late _CreateServiceProviderEntityMock createServiceProviderEntityMock;
  late _ServiceProviderReturnEntityMock serviceProviderReturnEntityMock;
  late CreateServiceProviderUsecase createServiceProviderUsecase;
  late _UserDataEntityMock userDataEntityMock;
  setUp(() {
    createServiceProviderEntityMock = _CreateServiceProviderEntityMock();
    createServiceProviderrepositoryMock = _CreateServiceProviderrepositoryMock();
    serviceProviderReturnEntityMock = _ServiceProviderReturnEntityMock();
    userDataEntityMock = _UserDataEntityMock();
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
