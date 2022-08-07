import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/user_data/user_data_sign_in_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/model/user_data_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/error/user_data_error.dart';

class UserSignInDataSourceMock extends Mock
    implements UserDataSignInDatasource {}

void main() {
  test('Deve retornar uma entidade corretamente', () async {
    final datasourceMock = UserSignInDataSourceMock();
    final model = UserDataModel();

    when(
      () => datasourceMock.sendUserData(userDataModel: model),
    ).thenAnswer(
      (_) async => UserDataModel(),
    );
    final sut = await datasourceMock.sendUserData(userDataModel: model);
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
    final sut = datasourceMock.sendUserData;
    expect(() async => sut(userDataModel: model), throwsException);
  });
}
