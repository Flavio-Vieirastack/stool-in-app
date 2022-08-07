import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_app_ui/features/auth/data/datasource/user_data/user_data_sign_in_datasource.dart';
import 'package:stool_in_app_ui/features/auth/data/model/user_data_model.dart';
import 'package:stool_in_app_ui/features/auth/domain/entity/user_data_entity.dart';

class UseDataSignInDataSourceMock extends Mock
    implements UserDataSignInDatasource {}

void main() {
  test('Deve retornar o tipo correto', () async {
    final mock = UseDataSignInDataSourceMock();
    final modelMock = UserDataModel();
    when(
      () => mock.sendUserData(userDataModel: modelMock),
    ).thenAnswer((_) async => UserDataEntity());
    final sut = await mock.sendUserData(userDataModel: modelMock);
    expect(sut, isA<UserDataEntity>());
  });
}
