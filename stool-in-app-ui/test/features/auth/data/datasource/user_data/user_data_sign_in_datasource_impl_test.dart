
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/export/rest_client_export.dart';
import 'package:stool_in/features/auth/export/auth_exports.dart';

import '../../../../../mock/user_data_sign_in_mock.dart';




class _RestClientPostMock extends Mock implements RestClientPost {}

void main() {
  late UserDataSignInDatasource userDataSignInDatasource;
  late _RestClientPostMock restClientPostMock;
  setUp(
    () {
      restClientPostMock = _RestClientPostMock();
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
        userPhotoUrl:
            'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png',
        userState: 'CE');

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
        userPhotoUrl:
            'https://love.doghero.com.br/wp-content/uploads/2018/12/golden-retriever-1.png',
        userState: 'CE');

    when(
      () => restClientPostMock.post(
        path: any(named: 'path'),
        data: any(named: 'data'),
      ),
    ).thenThrow(
      RestClientException()
    );
    final sut = userDataSignInDatasource.sendUserData;
    expect(() async => sut(userDataModel: model), throwsException);
  });
}
