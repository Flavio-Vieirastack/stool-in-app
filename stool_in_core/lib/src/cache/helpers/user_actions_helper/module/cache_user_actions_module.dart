
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../module/permanent_dependencies/permanent_module.dart';
import '../cache_user_actions_helper.dart';

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
