import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/shared/module/cubits/permanent_cubits.dart';
import 'package:stool_in/core/shared/presenter/cubit/geo_locator_cubit/geo_locator_cubit.dart';

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
