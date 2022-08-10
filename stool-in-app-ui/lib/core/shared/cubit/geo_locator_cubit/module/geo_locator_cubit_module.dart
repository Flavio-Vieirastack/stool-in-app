import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/shared/module/cubit/geo_locator_cubit.dart';
import 'package:stool_in_app_ui/core/shared/module/cubits/permanent_cubits.dart';

class GeoLocatorCubitModule implements PermanentCubits {
  @override
  List<SingleChildWidget> cubits() {
    return [
      Provider(
        create: (context) => GeoLocatorCubit(),
      )
    ];
  }
}
