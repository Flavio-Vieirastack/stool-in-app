import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/shared/push_notifications/module/send_push_notification_module.dart';

import '../../../../../exports/app_exports.dart';

@immutable
class PermanentModules {
  List<SingleChildWidget> dependencies() {
    return [
      ...RestClientModule().inject(),
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
      ...SendPushNotificationModule().inject(),
    ];
  }
}
