import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/features/auth/data/datasource/login/login_datasource.dart';
import 'package:stool_in/features/auth/data/datasource/login/login_datasource_impl.dart';
import 'package:stool_in/features/auth/data/model/auth_model.dart';
import 'package:stool_in/features/auth/domain/entity/user_token_entity.dart';

class PostImplMock extends Mock implements RestClientPost {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

void main() {
  late LoginDatasource loginDatasource;
  late PostImplMock postImplMock;
  late FirebaseAuthMock firebaseAuthMock;
  late UserTokenEntity userTokenEntity;
  late AuthModel authModel;
  late Map<String, dynamic> response;
  setUp(
    () {
      authModel = AuthModel(email: 'email', password: 'password');
      response = {'access_token': 'token'};
      userTokenEntity = UserTokenEntity(token: 'token');
      firebaseAuthMock = FirebaseAuthMock();
      postImplMock = PostImplMock();
      loginDatasource = LoginDatasourceImpl(
        restClientPost: postImplMock,
        firebaseAuth: firebaseAuthMock,
      );
    },
  );
  test('Deve retornar uma entidade de token corretamente', () async {
    when(
      () => postImplMock.post(
        path: any(named: 'path'),
        data: any(named: 'data'),
      ),
    ).thenAnswer(
        (_) async => RestClientResponse(data: response, statucCode: 200));
    final sut = await loginDatasource.apiLogin(authModel: authModel);
    expect(sut, userTokenEntity);
  });
}
