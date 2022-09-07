import 'dart:developer';

import '../cache_user_actions_helper.dart';





class SplashExecuteCacheActionsHelper extends CacheUserActionsHelper {
  Future<void> execute() async {
    log('Splash actions executed', name: 'INFO');
    await setUserGetDoubtsData(value: false);
    await setUserGetRulesData(value: false);
    await setUserGetCategoriesData(value: false);
    await setUserGetUserServiceTypesData(value: false);
  }
}
