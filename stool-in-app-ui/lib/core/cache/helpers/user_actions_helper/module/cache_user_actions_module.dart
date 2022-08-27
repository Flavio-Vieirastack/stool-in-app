import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../../exports/app_exports.dart';


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
