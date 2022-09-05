import 'package:stool_in/core/shared/data/push_notification/model/send_push_notification_model.dart';


abstract class SendPushNotificationDatasource {
  Future<bool> call({
    required SendPushNotificationModel sendPushNotificationModel,
  });
}
