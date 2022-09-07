import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in_core/stool_in_core.dart';


void main() {
  test('Deve retornar a key correta para onboardingFlowKey', () {
    const key = KeysConstants.onboardingFlowKey;
    const keyName = 'onboarding-flow';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userToken', () {
    const key = KeysConstants.userToken;
    const keyName = 'user-token';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userName', () {
    const key = KeysConstants.userName;
    const keyName = 'user-name';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userLocationLatitude', () {
    const key = KeysConstants.userLocationLatitude;
    const keyName = 'user-latitude';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userLocationaLogintude', () {
    const key = KeysConstants.userLocationaLogintude;
    const keyName = 'user-longitude';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userPhotoUrl', () {
    const key = KeysConstants.userPhotoUrl;
    const keyName = 'user-photo-url';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userFirebaseToken', () {
    const key = KeysConstants.userFirebaseToken;
    const keyName = 'user-firebase-token';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userFirebaseToken', () {
    const key = KeysConstants.userFirebasePushToken;
    const keyName = 'user-firebase-push-token';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userPassByDataPage', () {
    const key = KeysConstants.userPassByDataPage;
    const keyName = 'user-data-page';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userEmail', () {
    const key = KeysConstants.userEmail;
    const keyName = 'user-email';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userPassword', () {
    const key = KeysConstants.userPassword;
    const keyName = 'user-password';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userPassLoginToApi', () {
    const key = KeysConstants.userPassLoginToApi;
    const keyName = 'user-pass-login';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userPassLoginToFirebase', () {
    const key = KeysConstants.userPassLoginToFirebase;
    const keyName = 'user-pass-firebase';
    expect(key, keyName);
  });
  test('Deve retornar a key correta para userMakePasswordResetSolicitation', () {
    const key = KeysConstants.userMakePasswordResetSolicitation;
    const keyName = 'user-make-password-solicitation-firebase';
    expect(key, keyName);
  });
}
