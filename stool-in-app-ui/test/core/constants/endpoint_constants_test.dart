import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/constants/export/constants_export.dart';


void main() {
  test('Deve retornar o endpoint de getServiceProvider corretamente', () {
    const route = EndpointConstants.getServiceProvider;
    const routeName = '/service-provider';
    expect(route, routeName);
  });
  test('Deve retornar o endpoint de postUserData corretamente', () {
    const route = EndpointConstants.postUserData;
    const routeName = '/user-data';
    expect(route, routeName);
  });
  test('Deve retornar o endpoint de login corretamente', () {
    const route = EndpointConstants.login;
    const routeName = '/login';
    expect(route, routeName);
  });
  test('Deve retornar o endpoint de passwordReset corretamente', () {
    const route = EndpointConstants.passwordReset;
    const routeName = '/user';
    expect(route, routeName);
  });
  test('Deve retornar o endpoint de signIn corretamente', () {
    const route = EndpointConstants.signIn;
    const routeName = '/user';
    expect(route, routeName);
  });
}
