import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../shared/permanent_modules/cubits/permanent_cubits.dart';
import '../../shared/permanent_modules/dependencies/permanent_modules.dart';


@immutable
class PermanentDependencies {
  static List<SingleChildWidget> init() {
    final providers = [
      ...PermanentModules().dependencies(),
      ...PermanentCubits().cubits(),
    ];
    return providers;
  }
}
