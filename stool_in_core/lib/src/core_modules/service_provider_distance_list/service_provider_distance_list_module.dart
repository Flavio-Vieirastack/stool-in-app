import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_core/stool_in_core.dart';

class ServiceProviderDistanceListModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<ServiceProviderDistanceListCalculate>(
        create: (context) => ServiceProviderDistanceListCalculate(
          distanceHelperCalculate:
              Inject<DistanceHelperCalculate>(context).get(),
        ),
      ),
    ];
  }
}
