import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../../exports/app_exports.dart';



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
