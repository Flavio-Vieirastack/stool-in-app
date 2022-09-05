import 'package:dartz/dartz.dart';
import 'package:stool_in/core/shared/domain/push_notifications/error/send_push_notification_error.dart';

import '../entity/push_notification_params.dart';

abstract class SendPushNotificationUsecase {
Future<Either<SendPushNotificationError, bool>> call({
    required PushNotificationParams pushNotificationParams,
  });
}