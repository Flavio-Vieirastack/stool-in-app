import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../permanent_modules/cubits/permanent_cubits.dart';
import '../geo_locator_cubit.dart';




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
