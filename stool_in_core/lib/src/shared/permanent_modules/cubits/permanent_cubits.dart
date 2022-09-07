import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

import '../../cubit/firebase_storage/module/firebase_storage_cubit_module.dart';
import '../../cubit/geo_locator_cubit/module/geo_locator_cubit_module.dart';
import '../../cubit/internet_connection_cubit/module/internet_connection_cubit_module.dart';



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
