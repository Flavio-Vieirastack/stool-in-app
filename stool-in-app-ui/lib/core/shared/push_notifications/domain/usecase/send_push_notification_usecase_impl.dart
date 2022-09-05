import 'package:dartz/dartz.dart';
import 'package:stool_in/core/shared/push_notifications/domain/usecase/send_push_notification_usecase.dart';

import '../entity/push_notification_params.dart';
import '../error/send_push_notification_error.dart';
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
