import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../exports/app_exports.dart';




@immutable
class DistanceHelperModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<DistanceHelperCalculate>(
        create: (context) => DistanceHelperCalculate(),
      )
    ];
  }
}
