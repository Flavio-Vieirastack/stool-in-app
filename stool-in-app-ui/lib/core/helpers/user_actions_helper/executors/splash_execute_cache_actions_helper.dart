import 'dart:developer';

import 'package:stool_in/core/helpers/user_actions_helper/cache/cache_user_actions_helper.dart';

class SplashExecuteCacheActionsHelper extends CacheUserActionsHelper {
  Future<void> execute() async {
    log('Splash actions executed', name: 'INFO');
    await setUserGetDoubtsData(value: false);
  }
}
