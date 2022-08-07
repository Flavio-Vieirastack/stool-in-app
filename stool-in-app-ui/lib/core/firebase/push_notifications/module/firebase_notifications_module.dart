import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:stool_in_app_ui/core/firebase/push_notifications/firebase_notifications.dart';
import 'package:stool_in_app_ui/core/module/permanent_dependencies/permanent_module.dart';

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
