import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/helpers/user_actions_helper/cache/cache_user_actions_helper.dart';

void main() {
  test(
      'Deve retornar o valor booleano correto como true para userGetDoubtsData',
      () {
    final data = CacheUserActionsHelper().copyWith(userGetDoubtsData: true);
    final sut = data.userGetDoubtsData;
    expect(sut, true);
  });
  test(
      'Deve retornar o valor booleano correto como false para todos os retornos default',
      () {
    final data = CacheUserActionsHelper().copyWith();
    final sutuserGetDoubtsData = data.userGetDoubtsData;
    final userGetHomeData = data.userGetHomeData;
    final userGetRulesData = data.userGetRulesData;
    final userPassBySplashPage = data.userPassBySplashPage;
    expect(sutuserGetDoubtsData, false);
    expect(userGetHomeData, false);
    expect(userGetRulesData, false);
    expect(userPassBySplashPage, false);
  });
  test('Deve retornar o valor booleano correto como true para userGetHomeData',
      () {
    final data = CacheUserActionsHelper().copyWith(userGetHomeData: true);
    final sut = data.userGetHomeData;
    expect(sut, true);
  });
  test('Deve retornar o valor booleano correto como true para userGetRulesData',
      () {
    final data = CacheUserActionsHelper().copyWith(userGetRulesData: true);
    final sut = data.userGetRulesData;
    expect(sut, true);
  });
  test(
      'Deve retornar o valor booleano correto como true para userPassBySplashPage',
      () {
    final data = CacheUserActionsHelper().copyWith(userPassBySplashPage: true);
    final sut = data.userPassBySplashPage;
    expect(sut, true);
  });
}
