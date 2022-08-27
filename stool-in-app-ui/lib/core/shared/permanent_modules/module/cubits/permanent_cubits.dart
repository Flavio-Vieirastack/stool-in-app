import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../../export/shared_export.dart';

@immutable
class PermanentCubits {
  List<SingleChildWidget> cubits() {
    return [
      ...GeoLocatorCubitModule().cubits(),
      ...FirebaseStorageCubitModule().cubit(),
      ...InternetConnectionCubitModule().cubit(),
    ];
  }
}
