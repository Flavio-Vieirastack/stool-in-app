import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_logic/stool_in_app_logic.dart';
import 'package:stool_in_app_ui/core/module/main_module/inject.dart';
import 'package:stool_in_app_ui/core/module/permanent_dependencies/permanent_module.dart';

import '../distance_helper_calculate.dart';


@immutable
class DistanceHelperModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<HaversineDistance>(
        create: (context) => HaversineDistance(),
      ),
      Provider<DistanceHelperCalculate>(
        create: (context) => DistanceHelperCalculate(
          haversineDistance: Inject<HaversineDistance>(context).get(),
        ),
      ),
    ];
  }
}
