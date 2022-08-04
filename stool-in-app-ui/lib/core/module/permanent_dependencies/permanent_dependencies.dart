import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/rest_client/module/rest_client_module.dart';
import 'package:stool_in_app_ui/core/shared/module/cubits/permanent_cubits.dart';
import 'package:stool_in_app_ui/core/shared/module/dependencies/permanent_modules.dart';
@immutable
class PermanentDependencies {
  static List<SingleChildWidget> init() {
    final providers = [
      ...RestClientModule().inject(),
      ...PermanentModules().dependencies(),
      ...PermanentCubits().cubits(),
    ];
    return providers;
  }
}
