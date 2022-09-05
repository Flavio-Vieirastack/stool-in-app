import 'package:dartz/dartz.dart';
import 'package:stool_in/core/shared/domain/push_notifications/entity/push_notification_params.dart';
import 'package:stool_in/core/shared/domain/push_notifications/error/send_push_notification_error.dart';

abstract class SendPushNotificationRepository {
  Future<Either<SendPushNotificationError, bool>> call({
    required PushNotificationParams pushNotificationParams,
  });
}
