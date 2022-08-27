import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../../exports/app_exports.dart';



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
