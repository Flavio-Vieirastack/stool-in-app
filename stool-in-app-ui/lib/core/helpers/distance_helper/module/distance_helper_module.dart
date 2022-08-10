import 'package:flutter/material.dart';
import 'package:haversine_distance/haversine_distance.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../module/main_module/inject.dart';
import '../../../module/permanent_dependencies/permanent_module.dart';
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
