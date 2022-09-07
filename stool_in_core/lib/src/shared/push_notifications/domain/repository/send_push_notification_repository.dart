import 'package:dartz/dartz.dart';

import '../entity/push_notification_params.dart';
import '../error/send_push_notification_error.dart';

abstract class SendPushNotificationRepository {
  Future<Either<SendPushNotificationError, bool>> call({
    required PushNotificationParams pushNotificationParams,
  });
}
