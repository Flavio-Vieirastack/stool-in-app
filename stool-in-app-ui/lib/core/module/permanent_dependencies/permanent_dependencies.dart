import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../rest_client/export/rest_client_export.dart';
import '../../shared/export/shared_export.dart';


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
