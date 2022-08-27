import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/exports/app_exports.dart';


void main() {
  test('Deve retornar a rota correta para splashRoute', () {
    const route = RoutesConstants.splashRoute;
    const routeString = '/splash';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para onBoardingRoute', () {
    const route = RoutesConstants.onBoardingRoute;
    const routeString = '/onboarding';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para loginRoute', () {
    const route = RoutesConstants.loginRoute;
    const routeString = '/login';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para signInMainRoute', () {
    const route = RoutesConstants.signInMainRoute;
    const routeString = '/sign-in-main';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para signInDataRoute', () {
    const route = RoutesConstants.signInDataRoute;
    const routeString = '/sign-in-data';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para passwordRecoveryRoute', () {
    const route = RoutesConstants.passwordRecoveryRoute;
    const routeString = '/password-recovery';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para homeRoute', () {
    const route = RoutesConstants.homeRoute;
    const routeString = '/home';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para serviceProviderOnBoardingRoute', () {
    const route = RoutesConstants.serviceProviderOnBoardingRoute;
    const routeString = '/service-provider-onboarding';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para serviceProviderRegisterRoute', () {
    const route = RoutesConstants.serviceProviderRegisterRoute;
    const routeString = '/service-provider-register';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para servicesTodoRoute', () {
    const route = RoutesConstants.servicesTodoRoute;
    const routeString = '/services-todo';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para userServicesContractedRoute', () {
    const route = RoutesConstants.userServicesContractedRoute;
    const routeString = '/services-contracted';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para serviceProviderDetailRoute', () {
    const route = RoutesConstants.serviceProviderDetailRoute;
    const routeString = '/service-provider-detail';
    expect(route, routeString);
  });
  test('Deve retornar a rota correta para userProfileRoute', () {
    const route = RoutesConstants.userProfileRoute;
    const routeString = '/user-profile';
    expect(route, routeString);
  });
}
