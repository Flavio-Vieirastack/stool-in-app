import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/rest_client/module/rest_client_module.dart';

class PermanentDependencies {
  static List<SingleChildWidget> init() {
    final providers = [
      ...RestClientModule().restClientInject(),
    ];
    return providers;
  }
}
