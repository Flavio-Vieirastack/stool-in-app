import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/helpers/directory_helper/directory_helper.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_module.dart';

class DirectoryHelperModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<DirectoryHelper>(
        create: (context) => DirectoryHelper(),
      ),
    ];
  }
}
