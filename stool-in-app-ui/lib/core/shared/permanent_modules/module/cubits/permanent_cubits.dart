import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../exports/app_exports.dart';


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
