import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../module/export/module_export.dart';
import '../../export/firebase_export.dart';


class FirebaseNotificationsModule implements PermanentModule {
  @override
  List<SingleChildWidget> inject() {
    return [
      Provider<FireBaseNotifications>(
        create: (context) => FireBaseNotifications(),
      )
    ];
  }
}
