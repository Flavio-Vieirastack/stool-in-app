import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../../../exports/app_exports.dart';



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
