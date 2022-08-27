import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../export/shared_export.dart';


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
