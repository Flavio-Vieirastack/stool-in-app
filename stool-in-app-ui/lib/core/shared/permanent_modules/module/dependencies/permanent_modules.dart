import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/cache/module/cached_datasource_helper_module.dart';
import 'package:stool_in/core/core_modules/firebase_storage/firebase_storage_module.dart';
import 'package:stool_in/core/firebase/push_notifications/module/firebase_notifications_module.dart';
import 'package:stool_in/core/helpers/distance_helper/module/distance_helper_module.dart';
import 'package:stool_in/core/helpers/pick_image_helper/module/pick_image_helper_module.dart';
import 'package:stool_in/core/helpers/secure_storage_helper/module/secure_storage_module.dart';
import 'package:stool_in/core/helpers/storage_ref/module/user_storage_ref_module.dart';
import 'package:stool_in/core/helpers/user_actions_helper/cache/module/cache_user_actions_module.dart';
import 'package:stool_in/core/helpers/vote_ratting/module/vote_ratting_module.dart';
import 'package:stool_in/core/shared/send_email_veirifcation/module/send_email_verification_module.dart';

import '../../../../core_modules/firebase_auth/firebase_auth_module.dart';


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
