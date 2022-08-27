import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../exports/app_exports.dart';


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
