import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../../cache/helpers/user_actions_helper/module/cache_user_actions_module.dart';
import '../../../cache/module/cached_datasource_helper_module.dart';
import '../../../firebase/push_notifications/module/firebase_notifications_module.dart';
import '../../../helpers/distance_helper/module/distance_helper_module.dart';
import '../../../helpers/pick_image_helper/module/pick_image_helper_module.dart';
import '../../../helpers/secure_storage_helper/module/secure_storage_module.dart';
import '../../../helpers/storage_ref/module/user_storage_ref_module.dart';
import '../../../helpers/vote_ratting/module/vote_ratting_module.dart';
import '../../../rest_client/module/rest_client_module.dart';
import '../../push_notifications/module/send_push_notification_module.dart';
import '../../send_email_veirifcation/module/send_email_verification_module.dart';


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
