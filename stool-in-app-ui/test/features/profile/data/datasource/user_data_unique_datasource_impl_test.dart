import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/exports/app_exports.dart';
import 'package:stool_in/features/profile/data/datasource/user_data_unique_datasource.dart';
import 'package:stool_in/features/profile/data/datasource/user_data_unique_datasource_impl.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_entity.dart';
import 'package:stool_in/features/profile/domain/entity/user_data_unique_location.dart';
import 'package:stool_in/features/profile/domain/error/update_user_data_error.dart';
import 'package:stool_in/features/profile/domain/error/user_data_unique_error.dart';

import '../../../../mock/user_data_unique_model_mock.dart';

class _RestCLientGetMock extends Mock implements RestClientGet {}

class _RestClientPatchMock extends Mock implements RestClientPatch {}

class _CalculateDistanceMock extends Mock
    implements CalculateDistanceForUserDataUnique {}

class _RestClientResponseMock extends Mock implements RestClientResponse {}

void main() {
  late _RestCLientGetMock restCLientGetMock;
  late UserDataUniqueDatasource uniqueDatasource;
  late _RestClientPatchMock restClientPatchMock;
  late _CalculateDistanceMock calculateDistanceMock;
  late UserDataUniqueLocation userDataUniqueLocation;
  late _RestClientResponseMock responseMock;
  late UserDataModel userDataModel;
  setUp(() {
    restCLientGetMock = _RestCLientGetMock();
    userDataModel = UserDataModel();
    restClientPatchMock = _RestClientPatchMock();
    userDataUniqueLocation = UserDataUniqueLocation(latitude: 1, longitude: 1);
    calculateDistanceMock = _CalculateDistanceMock();
    responseMock = _RestClientResponseMock();
    uniqueDatasource = UserDataUniqueDatasourceImpl(
      restClientGet: restCLientGetMock,
      restClientPatch: restClientPatchMock,
      calculateDistanceForUserDataUnique: calculateDistanceMock,
    );
    registerFallbackValue(responseMock);
    registerFallbackValue(Location(latitude: 1, longitude: 1));
  });
  group('getUserDataUnique', () {
    test('Deve retornar a entidade corretamente para get user data unique',
        () async {
      when(
        () => calculateDistanceMock.calculateDistance(
            result: any(named: 'result'),
            userLocation: any(named: 'userLocation')),
      ).thenReturn(1);
      when(
        () => restCLientGetMock.get(path: any(named: 'path')),
      ).thenAnswer((_) async =>
          RestClientResponse(statucCode: 200, data: userDataUniqueModelMock));
      final sut = await uniqueDatasource.getUserDataUnique(
          userDataUniqueLocation: userDataUniqueLocation);
      expect(sut, isA<UserDataUniqueEntity>());
    });
    test(
        'Deve chamar o rest client ao retornar a entidade corretamente para get user data unique',
        () async {
      when(
        () => calculateDistanceMock.calculateDistance(
            result: any(named: 'result'),
            userLocation: any(named: 'userLocation')),
      ).thenReturn(1);
      when(
        () => restCLientGetMock.get(path: any(named: 'path')),
      ).thenAnswer((_) async =>
          RestClientResponse(statucCode: 200, data: userDataUniqueModelMock));
      final sut = await uniqueDatasource.getUserDataUnique(
          userDataUniqueLocation: userDataUniqueLocation);
      expect(sut, isA<UserDataUniqueEntity>());
      verify(
        () => restCLientGetMock.get(path: any(named: 'path')),
      ).called(1);
    });
    test(
        'Deve retornar um erro ao retornar a entidade corretamente para get user data unique',
        () async {
      when(
        () => calculateDistanceMock.calculateDistance(
            result: any(named: 'result'),
            userLocation: any(named: 'userLocation')),
      ).thenReturn(1);
      when(
        () => restCLientGetMock.get(path: any(named: 'path')),
      ).thenThrow(UserDataUniqueError(message: 'message'));
      final sut = uniqueDatasource.getUserDataUnique;
      expect(
        () async => sut(userDataUniqueLocation: userDataUniqueLocation),
        throwsA(isA<UserDataUniqueError>()),
      );
    });
  });

  group('updateUserData', () {
    test('Deve retornar future void ao fazer update do user unique data',
        () async {
      when(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: any(named: 'data')),
      ).thenAnswer((_) async => RestClientResponse(
            statucCode: 200,
          ));
      final sut = uniqueDatasource.updateUserData(userDataModel: userDataModel);
      expect(sut, isA<Future<void>>());
    });
    test(
        'Deve chamar o patch ao retornar future void ao fazer update do user unique data',
        () async {
      when(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: any(named: 'data')),
      ).thenAnswer((_) async => RestClientResponse(
            statucCode: 200,
          ));
      final sut = uniqueDatasource.updateUserData(userDataModel: userDataModel);
      expect(sut, isA<Future<void>>());
      verify(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: any(named: 'data')),
      ).called(1);
    });
    test('Deve retornar um erro ao fazer update do user unique data', () async {
      when(
        () => restClientPatchMock.patch(
            path: any(named: 'path'), data: any(named: 'data')),
      ).thenThrow(UpdateUserDataError(message: 'message'));
      final sut = uniqueDatasource.updateUserData;
      expect(() async => sut(userDataModel: userDataModel),
          throwsA(isA<UpdateUserDataError>()));
    });
  });
}
