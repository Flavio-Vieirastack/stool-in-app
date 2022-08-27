import 'dart:developer';

import '../../../export/cache_export.dart';



class SplashExecuteCacheActionsHelper extends CacheUserActionsHelper {
  Future<void> execute() async {
    log('Splash actions executed', name: 'INFO');
    await setUserGetDoubtsData(value: false);
    await setUserGetRulesData(value: false);
    await setUserGetCategoriesData(value: false);
    await setUserGetUserServiceTypesData(value: false);
  }
}
