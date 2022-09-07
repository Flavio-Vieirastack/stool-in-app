import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_logic/stool_in_logic.dart';


class _UserDataUniqueRepositoryMock extends Mock
    implements UserDataUniqueRepository {}

class _UserDataUniqueEntityMock extends Mock implements UserDataUniqueEntity {}

void main() {
  late _UserDataUniqueRepositoryMock userDataUniqueRepositoryMock;
  late UserDataUniqueUsecase userDataUniqueUsecase;
  late _UserDataUniqueEntityMock uniqueEntityMock;
  late UserDataUniqueLocation location;
  setUp(() {
    userDataUniqueRepositoryMock = _UserDataUniqueRepositoryMock();
    userDataUniqueUsecase = UserDataUniqueUsecaseImpl(
      userDataUniqueRepository: userDataUniqueRepositoryMock,
    );
    location = UserDataUniqueLocation(latitude: 1, longitude: 1);
    uniqueEntityMock = _UserDataUniqueEntityMock();
  });

  group('getUserDataUnique', () {
    test('Deve retornar uma entidade de userDataUnique', () async {
      when(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
            userDataUniqueLocation: location),
      ).thenAnswer((_) async => Right(uniqueEntityMock));
      final sut = await userDataUniqueUsecase.getUserDataUnique(
          userDataUniqueLocation: location);
      expect(sut, Right(uniqueEntityMock));
    });
    test('Deve chamar o repository ao retornar uma entidade de userDataUnique',
        () async {
      when(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
            userDataUniqueLocation: location),
      ).thenAnswer((_) async => Right(uniqueEntityMock));
      final sut = await userDataUniqueUsecase.getUserDataUnique(
          userDataUniqueLocation: location);
      expect(sut, Right(uniqueEntityMock));
      verify(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
            userDataUniqueLocation: location),
      ).called(1);
    });
    test('Deve retornar um erro ao chamar o repository ao retornar uma entidade de userDataUnique',
        () async {
      when(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
            userDataUniqueLocation: location),
      ).thenAnswer((_) async => Right(uniqueEntityMock));
      final sut = await userDataUniqueUsecase.getUserDataUnique(
          userDataUniqueLocation: location);
      expect(sut, Right(uniqueEntityMock));
    });
    test(
        'Deve retornar um erro ao tentar retornar uma entidade de userDataUnique',
        () async {
      when(
        () => userDataUniqueRepositoryMock.getUserDataUnique(
          userDataUniqueLocation: location,
        ),
      ).thenAnswer((_) async => Left(UserDataUniqueError(message: 'message')));
      final sut = await userDataUniqueUsecase.getUserDataUnique(
        userDataUniqueLocation: location,
      );
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
    test('Deve chamar o repository retornar void ao fazer update do usuário',
        () async {
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
