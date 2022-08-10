import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/shared/cubit/geo_locator_cubit/module/geo_locator_cubit_module.dart';
@immutable
class PermanentCubits {
  List<SingleChildWidget> cubits() {
    return [
      ...GeoLocatorCubitModule().cubits(),
    ];
  }
}
