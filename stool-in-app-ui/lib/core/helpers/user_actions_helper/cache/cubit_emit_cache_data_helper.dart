import 'dart:developer';

import 'package:flutter/foundation.dart';

class CubitEmitCacheDataHelper {
  static returnCachedDataOrApiData({
    required bool falseCondition,
    required VoidCallback apiEmition,
    required VoidCallback cacheEmition,
    required AsyncCallback setConditionToTrue,
  }) {
    if (falseCondition == false) {
      apiEmition.call();
      setConditionToTrue.call();
      log('Call data from api', name: 'INFO');
    } else {
      log('Call data from cache', name: 'INFO');
      cacheEmition.call();
    }
  }
}
