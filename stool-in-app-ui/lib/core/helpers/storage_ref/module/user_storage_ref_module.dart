import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/helpers/storage_ref/user_storage_ref.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_module.dart';

class UserStorageRefModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<UserStorageRef>(
        create: (context) => UserStorageRef(),
      )
    ];
  }
}
