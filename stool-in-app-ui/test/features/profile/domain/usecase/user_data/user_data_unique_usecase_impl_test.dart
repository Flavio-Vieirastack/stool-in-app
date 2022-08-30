import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';
import 'package:stool_in/features/profile/domain/error/update_user_data_error.dart';
import 'package:stool_in/features/profile/domain/error/user_data_unique_error.dart';
import 'package:stool_in/features/profile/domain/repository/user_data_unique_repository.dart';
import 'package:stool_in/features/profile/domain/usecase/user_data/user_data_unique_usecase.dart';
import 'package:stool_in/features/profile/domain/usecase/user_data/user_data_unique_usecase_impl.dart';

class _UserDataUniqueRepositoryMock extends Mock
    implements UserDataUniqueRepository {}

class _UserDataUniqueEntityMock extends Mock implements UserDataUniqueEntity {}

void main() {
  late _UserDataUniqueRepositoryMock userDataUniqueRepositoryMock;
  late UserDataUniqueUsecase userDataUniqueUsecase;
  late _UserDataUniqueEntityMock uniqueEntityMock;
  setUp(() {
    userDataUniqueRepositoryMock = _UserDataUniqueRepositoryMock();
    userDataUniqueUsecase = UserDataUniqueUsecaseImpl(
      userDataUniqueRepository: userDataUniqueRepositoryMock,
    );
    uniqueEntityMock = _UserDataUniqueEntityMock();
  });

  group('getUserDataUnique', () {
    test('Deve retornar uma entidade de userDataUnique', () async {
      when(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
          latitude: 1,
          longitude: 1,
        ),
      ).thenAnswer((_) async => Right(uniqueEntityMock));
      final sut = await userDataUniqueUsecase.getUserDataUnique(
          latitude: 1, longitude: 1);
      expect(sut, Right(uniqueEntityMock));
    });
    test('Deve chamar o repository ao retornar uma entidade de userDataUnique',
        () async {
      when(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
          latitude: 1,
          longitude: 1,
        ),
      ).thenAnswer((_) async => Right(uniqueEntityMock));
      final sut = await userDataUniqueUsecase.getUserDataUnique(
          latitude: 1, longitude: 1);
      expect(sut, Right(uniqueEntityMock));
      verify(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
            latitude: 1, longitude: 1),
      ).called(1);
    });
    test('Deve chamar o repository ao retornar uma entidade de userDataUnique',
        () async {
      when(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
          latitude: 1,
          longitude: 1,
        ),
      ).thenAnswer((_) async => Right(uniqueEntityMock));
      final sut = await userDataUniqueUsecase.getUserDataUnique(
          latitude: 1, longitude: 1);
      expect(sut, Right(uniqueEntityMock));
    });
    test(
        'Deve retornar um erro ao tentar retornar uma entidade de userDataUnique',
        () async {
      when(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
          latitude: 1,
          longitude: 1,
        ),
      ).thenAnswer((_) async => Left(UserDataUniqueError(message: 'message')));
      final sut = await userDataUniqueUsecase.getUserDataUnique(
          latitude: 1, longitude: 1);
      expect(sut, Left(UserDataUniqueError(message: 'message')));
    });
  });

  group('updateUserData', () {
    test('Deve retornar void ao fazer update do usuário', () async {
      when(
        () => userDataUniqueRepositoryMock.updateUserData(
            userDataEntity: uniqueEntityMock),
      ).thenAnswer((_) async => const Right(null));
      final sut = await userDataUniqueUsecase.updateUserData(
          userDataEntity: uniqueEntityMock);
      expect(sut, const Right(null));
    });
    test('Deve chamar o repository retornar void ao fazer update do usuário', () async {
      when(
        () => userDataUniqueRepositoryMock.updateUserData(
            userDataEntity: uniqueEntityMock),
      ).thenAnswer((_) async => const Right(null));
      final sut = await userDataUniqueUsecase.updateUserData(
          userDataEntity: uniqueEntityMock);
      expect(
        sut,
        const Right(null),
      );
      verify(
        () => userDataUniqueRepositoryMock.updateUserData(
            userDataEntity: uniqueEntityMock),
      ).called(1);
    });
    test('Deve um erro ao fazer update do usuário', () async {
      when(
        () => userDataUniqueRepositoryMock.updateUserData(
            userDataEntity: uniqueEntityMock),
      ).thenAnswer((_) async => Left(UpdateUserDataError(message: 'message')));
      final sut = await userDataUniqueUsecase.updateUserData(
          userDataEntity: uniqueEntityMock);
      expect(
        sut,
        Left(UpdateUserDataError(message: 'message')),
      );
    });
  });
}
