import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/firebase/firebase_auth/module/firebase_auth_module.dart';
import 'package:stool_in_app_ui/core/helpers/distance_helper/module/distance_helper_module.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/module/secure_storage_module.dart';
import 'package:stool_in_app_ui/core/helpers/vote_ratting/module/vote_ratting_module.dart';
@immutable
class PermanentModules {
  List<SingleChildWidget> dependencies() {
    return [
      ...SecureStorageModule().inject(),
      ...DistanceHelperModule().inject(),
      ...VoteRattingModule().inject(),
      ...FirebaseAuthModule().inject(),
    ];
  }
}
