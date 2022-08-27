import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../module/export/module_export.dart';
import '../../../export/cache_export.dart';

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
