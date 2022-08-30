import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/profile/data/datasource/user_data_unique_datasource.dart';
import 'package:stool_in/features/profile/data/repository/user_data_unique_repository_impl.dart';
import 'package:stool_in/features/profile/domain/entity/services_contracted_entity.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_location.dart';
import 'package:stool_in/features/profile/domain/error/update_user_data_error.dart';
import 'package:stool_in/features/profile/domain/error/user_data_unique_error.dart';
import 'package:stool_in/features/profile/domain/repository/user_data_unique_repository.dart';

class _UserDataUniqueDatasourceMock extends Mock
    implements UserDataUniqueDatasource {}

class _UserDataEntityMock extends Mock implements UserDataEntity {}

class _ServicesContractedEntityMock extends Mock
    implements ServicesContractedEntity {}

void main() {
  late _UserDataUniqueDatasourceMock uniqueDatasourceMock;
  late UserDataUniqueRepository userDataUniqueRepository;
  late UserDataUniqueEntity uniqueEntityMock;
  late _ServicesContractedEntityMock servicesContractedEntityMock;
  late UserDataUniqueLocation location;
  late UserDataModel userDataModel;
  late _UserDataEntityMock userDataEntityMock;
  setUpAll(() {
    location = UserDataUniqueLocation(latitude: 1, longitude: 1);
    userDataModel = UserDataModel();
    userDataEntityMock = _UserDataEntityMock();
    uniqueDatasourceMock = _UserDataUniqueDatasourceMock();
    servicesContractedEntityMock = _ServicesContractedEntityMock();
    userDataUniqueRepository = UserDataUniqueRepositoryImpl(
        userDataUniqueDatasource: uniqueDatasourceMock);
    uniqueEntityMock = UserDataUniqueEntity(
        servicesContacted: [servicesContractedEntityMock],
        cep: 'cep',
        city: 'city',
        district: 'district',
        houseNumber: 'houseNumber',
        referencePoint: 'referencePoint',
        serviceProviderId: 1,
        street: 'street',
        userFirebasePushToken: 'userFirebasePushToken',
        userFirebaseUuid: 'userFirebaseUuid',
        userLocationLatitude: 2.0,
        userLocationLongitude: 2.0,
        userName: 'userName',
        userPhotoUrl: 'userPhotoUrl',
        userState: 'userState');
  });

  group('getUserDataUnique', () {
    test('Deve retornar uma entidade correta de user data unique', () async {
      when(
        () => uniqueDatasourceMock.getUserDataUnique(
            userDataUniqueLocation: location),
      ).thenAnswer((_) async => uniqueEntityMock);
      final sut = await userDataUniqueRepository.getUserDataUnique(
          userDataUniqueLocation: location);
      expect(sut, Right(uniqueEntityMock));
    });
    test(
        'Deve chamar o datasource ao retornar uma entidade correta de user data unique',
        () async {
      when(
        () => uniqueDatasourceMock.getUserDataUnique(
          userDataUniqueLocation: location,
        ),
      ).thenAnswer(
        (_) async => uniqueEntityMock,
      );
      final sut = await userDataUniqueRepository.getUserDataUnique(
        userDataUniqueLocation: location,
      );
      expect(sut, Right(uniqueEntityMock));
      verify(
        () => uniqueDatasourceMock.getUserDataUnique(
          userDataUniqueLocation: location,
        ),
      ).called(2);
    });
    test(
        'Deve retornar um erro ao retornar uma entidade correta de user data unique',
        () async {
      when(
        () => uniqueDatasourceMock.getUserDataUnique(
          userDataUniqueLocation: location,
        ),
      ).thenThrow(
        UserDataUniqueError(message: 'message'),
      );
      final sut = await userDataUniqueRepository.getUserDataUnique(
        userDataUniqueLocation: location,
      );
      expect(sut, Left(UserDataUniqueError(message: 'message')));
    });
  });

  group('updateUserData', () {
    test('Deve retornar um valor void para o repository do update user data',
        () async {
      when(
        () => uniqueDatasourceMock.updateUserData(userDataModel: userDataModel),
      ).thenAnswer((_) async => Future.value());
      final sut = await userDataUniqueRepository.updateUserData(
          userDataEntity:
              UserDataModel.fromEntity(userDataEntity: userDataEntityMock));
      expect(sut, const Right(null));
    });
    test(
        'Deve chamar o datasource ao retornar um valor void para o repository do update user data',
        () async {
      when(
        () => uniqueDatasourceMock.updateUserData(userDataModel: userDataModel),
      ).thenAnswer((_) async => Future.value());
      final sut = await userDataUniqueRepository.updateUserData(
          userDataEntity:
              UserDataModel.fromEntity(userDataEntity: userDataEntityMock));
      expect(sut, const Right(null));
      verify(
        () => uniqueDatasourceMock.updateUserData(userDataModel: userDataModel),
      ).called(2);
    });
    test(
        'Deve retornar um erro ao retornar um valor void para o repository do update user data',
        () async {
      when(
        () => uniqueDatasourceMock.updateUserData(userDataModel: userDataModel),
      ).thenThrow(UpdateUserDataError(message: 'message'));
      final sut = await userDataUniqueRepository.updateUserData(
          userDataEntity:
              UserDataModel.fromEntity(userDataEntity: userDataEntityMock));
      expect(sut, Left(UpdateUserDataError(message: 'message')));
    });
  });
}
