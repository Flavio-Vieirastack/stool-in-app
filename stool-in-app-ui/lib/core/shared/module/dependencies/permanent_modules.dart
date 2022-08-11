import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/firebase/firebase_auth/module/firebase_auth_module.dart';
import 'package:stool_in/core/firebase/push_notifications/module/firebase_notifications_module.dart';
import 'package:stool_in/core/helpers/distance_helper/module/distance_helper_module.dart';
import 'package:stool_in/core/helpers/pick_image_helper/module/pick_image_helper_module.dart';
import 'package:stool_in/core/helpers/secure_storage_helper/module/secure_storage_module.dart';
import 'package:stool_in/core/helpers/vote_ratting/module/vote_ratting_module.dart';

@immutable
class PermanentModules {
  List<SingleChildWidget> dependencies() {
    return [
      ...SecureStorageModule().inject(),
      ...DistanceHelperModule().inject(),
      ...VoteRattingModule().inject(),
      ...FirebaseAuthModule().inject(),
      ...FirebaseNotificationsModule().inject(),
      ...PickImageHelperModule().inject()
    ];
  }
}
