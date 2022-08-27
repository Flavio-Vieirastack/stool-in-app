import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../cache/export/cache_export.dart';
import '../../../../core_modules/export/core_modules.dart';
import '../../../../firebase/export/firebase_export.dart';
import '../../../../helpers/export/helpers_export.dart';
import '../../../export/shared_export.dart';



@immutable
class PermanentModules {
  List<SingleChildWidget> dependencies() {
    return [
      ...SecureStorageModule().inject(),
      ...DistanceHelperModule().inject(),
      ...VoteRattingModule().inject(),
      ...FirebaseAuthModule().inject(),
      ...FirebaseNotificationsModule().inject(),
      ...PickImageHelperModule().inject(),
      ...FirebaseStorageModule().inject(),
      ...UserStorageRefModule().inject(),
      ...SendEmailVerificationModule().inject(),
      ...CachedDatasourceHelperModule().inject(),
      ...CacheUserActionsModule().inject(),
    ];
  }
}
