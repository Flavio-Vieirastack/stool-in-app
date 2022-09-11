import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_core/stool_in_core.dart';

class ServiceProviderSortListHelperModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<ServiceProviderSortListHelper>(
        create: (context) => ServiceProviderSortListHelper(),
      )
    ];
  }
}
