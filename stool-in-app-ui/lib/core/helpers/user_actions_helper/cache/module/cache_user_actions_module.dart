import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in/core/helpers/user_actions_helper/cache/cache_user_actions_helper.dart';
import 'package:stool_in/core/module/permanent_dependencies/permanent_module.dart';

class CacheUserActionsModule extends PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider(
        create: (context) => CacheUserActionsHelper(),
      ),
    ];
  }
}
