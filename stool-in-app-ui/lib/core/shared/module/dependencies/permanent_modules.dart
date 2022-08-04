import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/helpers/secure_storage_helper/module/secure_storage_module.dart';

class PermanentModules {
  List<SingleChildWidget> dependencies() {
    return [
      ...SecureStorageModule().secureStorageInject()
    ];
  }
}
