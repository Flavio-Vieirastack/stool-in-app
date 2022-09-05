import 'package:stool_in/core/shared/domain/push_notifications/error/send_push_notification_error.dart';
import 'package:stool_in/core/shared/domain/push_notifications/entity/push_notification_params.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/core/shared/domain/push_notifications/usecase/send_push_notification_usecase.dart';

import '../repository/send_push_notification_repository.dart';

class SendPushNotificationUsecaseImpl implements SendPushNotificationUsecase {
  final SendPushNotificationRepository _sendPushNotificationRepository;
  SendPushNotificationUsecaseImpl({
    required SendPushNotificationRepository sendPushNotificationRepository,
  }) : _sendPushNotificationRepository = sendPushNotificationRepository;
  @override
  Future<Either<SendPushNotificationError, bool>> call({
    required PushNotificationParams pushNotificationParams,
  }) async {
    return await _sendPushNotificationRepository(
      pushNotificationParams: pushNotificationParams,
    );
  }
}
