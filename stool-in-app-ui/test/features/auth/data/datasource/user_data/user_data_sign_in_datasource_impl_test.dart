import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/constants/endpoint_constants.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/auth/data/datasource/user_data/user_data_sign_in_datasource.dart';
import 'package:stool_in/features/auth/data/datasource/user_data/user_data_sign_in_datasource_impl.dart';
import 'package:stool_in/features/auth/data/model/user_data_model.dart';
import 'package:stool_in/features/auth/domain/error/user_data_error.dart';

import '../../../../../mock/user_data_sign_in_mock.dart';

class UserSignInDataSourceMock extends Mock
    implements UserDataSignInDatasource {}

class RestClientPostMock extends Mock implements RestClientPost {}

void main() {
  late UserDataSignInDatasource userDataSignInDatasource;
  late RestClientPostMock restClientPostMock;
  setUp(
    () {
      restClientPostMock = RestClientPostMock();
      userDataSignInDatasource =
          UserDataSignInDatasourceImpl(restClientPost: restClientPostMock);
    },
  );
  test('Deve retornar uma entidade corretamente', () async {
    final model = UserDataModel(
      cep: '63101220',
      city: 'crato',
      district: 'Pinto madeira',
      houseNumber: '255',
      referencePoint: 'Próximo a x',
      street: 'Rua monsenhor esmeraldo',
      userFirebasePushToken: 'push',
      userFirebaseUuid: 'UUid',
      userLocationLatitude: 2565,
      userLocationLongitude: 58741,
      userName: 'Flavio emerson 5689',
      userPhotoUrl: 'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png',
      userState: 'CE'
    );

    when(
      () => restClientPostMock.post(
        path: any(named: 'path'),
        data: any(named: 'data'),
      ),
    ).thenAnswer(
      (_) async => RestClientResponse(
        data: userDataSignInResponseMock,
        statucCode: 200,
      ),
    );
    final sut =
        await userDataSignInDatasource.sendUserData(userDataModel: model);
    expect(sut, model);
  });
  test('Deve retornar um erro corretamente', () async {
    final datasourceMock = UserSignInDataSourceMock();
    final model = UserDataModel();

    when(
      () => datasourceMock.sendUserData(userDataModel: model),
    ).thenThrow(
      UserDataError(message: 'message'),
    );
    final sut = userDataSignInDatasource.sendUserData;
    expect(() async => sut(userDataModel: model), throwsException);
  });
}
