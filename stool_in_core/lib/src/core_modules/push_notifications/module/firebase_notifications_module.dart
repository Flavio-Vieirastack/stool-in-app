import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_core/src/core_modules/push_notifications/firebase_notifications.dart';

import '../../../module/permanent_dependencies/permanent_module.dart';




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
