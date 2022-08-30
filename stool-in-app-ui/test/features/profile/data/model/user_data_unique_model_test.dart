import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/features/profile/data/model/user_data_unique_model.dart';

import '../../../../mock/user_data_unique_model_mock.dart';

void main() {
  test('Deve retornar o valor correto para userName', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.userName;
    const matcher = 'Duncan Fadel';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para cep', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.cep;
    const matcher = '55017';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para city', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.city;
    const matcher = 'East New Trevion';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para district', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.district;
    const matcher = 'Murray Hill';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para houseNumber', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.houseNumber;
    const matcher = '265964';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para referencePoint', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.referencePoint;
    const matcher = 'Dyker Heights';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para serviceProviderId', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.serviceProviderId;
    const matcher = 2;
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para street', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.street;
    const matcher = 'Murazik Inlet';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para userFirebasePushToken', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.userFirebasePushToken;
    const matcher = "OdQmC'hZCo_,i0YZL";
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para userFirebaseUuid', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.userFirebaseUuid;
    const matcher = "H#.Mr^w%!]tqnrPf(^HWfk1gCL!vA[";
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para userLocationLatitude', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.userLocationLatitude;
    const matcher = 10.05458724418554;
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para userLocationLongitude', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.userLocationLongitude;
    const matcher = 10.68846975445786;
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para userPhotoUrl', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.userPhotoUrl;
    const matcher = 'https://source.unsplash.com/640x480';
    expect(sut, matcher);
  });
  test('Deve retornar o valor correto para userState', () {
    final model = UserDataUniqueModel.fromMap(userDataUniqueModelMock);
    final sut = model.userState;
    const matcher = 'Utah';
    expect(sut, matcher);
  });
}
