import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../exports/app_exports.dart';




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
