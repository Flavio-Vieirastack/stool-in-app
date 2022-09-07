


import '../model/send_push_notification_model.dart';

abstract class SendPushNotificationDatasource {
  Future<bool> call({
    required SendPushNotificationModel sendPushNotificationModel,
  });
}
