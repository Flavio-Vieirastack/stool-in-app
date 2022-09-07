import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../module/main_module/inject.dart';
import '../../../module/permanent_dependencies/permanent_module.dart';
import '../../secure_storage_helper/secure_storage_contracts.dart';
import '../user_storage_ref.dart';



@immutable
class UserStorageRefModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<UserStorageRef>(
        create: (context) => UserStorageRef(
          readLocalSecurityStorage:
              Inject<ReadLocalSecurityStorage>(context).get(),
        ),
      )
    ];
  }
}
