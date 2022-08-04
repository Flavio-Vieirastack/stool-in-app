import 'package:haversine_distance/haversine_distance.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/helpers/distance_helper/distance_helper_calculate.dart';
import 'package:stool_in_app_ui/core/module/inject.dart';

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
