import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/features/auth/data/datasource/user_data/user_data_sign_in_datasource.dart';
import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/auth/data/repository/user_data/user_data_sign_in_repository_impl.dart';
import 'package:stool_in/features/auth/domain/entity/user_data_entity.dart';
import 'package:stool_in/features/auth/domain/error/user_data_error.dart';
import 'package:stool_in/features/auth/domain/repository/user_data/user_data_sign_in_respository.dart';

class _UserDataSignInDatasourceMock extends Mock
    implements UserDataSignInDatasource {}

void main() {
  late _UserDataSignInDatasourceMock userDataSignInDatasourceMock;
  late UserDataEntity userDataEntity;
  late UserDataSignInRepository userDataSignInRepository;
  setUp(() {
    userDataSignInDatasourceMock = _UserDataSignInDatasourceMock();
    userDataEntity = UserDataEntity();
    userDataSignInRepository = UserDataSignInRepositoryImpl(
        userDataSignInDatasource: userDataSignInDatasourceMock);
  });
  test('Deve retornar um user data entity', () async {
    when(() => userDataSignInDatasourceMock.sendUserData(
            userDataModel:
                UserDataModel.fromEntity(userDataEntity: userDataEntity)))
        .thenAnswer((_) async => userDataEntity);
    final sut = await userDataSignInRepository.sendUserData(
        userDataEntity: userDataEntity);
    expect(sut, Right(userDataEntity));
  });
  test('Deve chamar o datasource corretamente', () async {
    when(() => userDataSignInDatasourceMock.sendUserData(
            userDataModel:
                UserDataModel.fromEntity(userDataEntity: userDataEntity)))
        .thenAnswer((_) async => userDataEntity);
    final sut = await userDataSignInRepository.sendUserData(
        userDataEntity: userDataEntity);
    expect(sut, Right(userDataEntity));
    verify(
      () => userDataSignInDatasourceMock.sendUserData(
          userDataModel:
              UserDataModel.fromEntity(userDataEntity: userDataEntity)),
    ).called(1);
  });
  test('Deve retornar um erro do tipo esperado corretamente', () async {
    when(() => userDataSignInDatasourceMock.sendUserData(
            userDataModel:
                UserDataModel.fromEntity(userDataEntity: userDataEntity)))
        .thenThrow(UserDataError(message: 'message'));
    final sut = userDataSignInRepository.sendUserData;
    expect(await sut(userDataEntity: userDataEntity),
        Left(UserDataError(message: 'message')));
  });
}
