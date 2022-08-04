import 'package:flutter/material.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/module/main_module/inject.dart';

import '../distance_helper_calculate.dart';
@immutable
class DistanceHelperModule {
  List<SingleChildWidget> module() {
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
