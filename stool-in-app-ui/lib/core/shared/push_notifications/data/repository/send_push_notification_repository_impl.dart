import 'dart:developer';

import 'package:stool_in/core/shared/domain/push_notifications/error/send_push_notification_error.dart';
import 'package:stool_in/core/shared/domain/push_notifications/entity/push_notification_params.dart';
import 'package:dartz/dartz.dart';
import 'package:stool_in/core/shared/push_notifications/data/datasource/send_push_notification_datasource.dart';
import 'package:stool_in/core/shared/push_notifications/data/model/send_push_notification_model.dart';
import 'package:stool_in/core/shared/push_notifications/domain/repository/send_push_notification_repository.dart';

class SendPushNotificationRepositoryImpl
    implements SendPushNotificationRepository {
  final SendPushNotificationDatasource _sendPushNotificationDatasource;
  SendPushNotificationRepositoryImpl({
    required SendPushNotificationDatasource sendPushNotificationDatasource,
  }) : _sendPushNotificationDatasource = sendPushNotificationDatasource;
  @override
  Future<Either<SendPushNotificationError, bool>> call({
    required PushNotificationParams pushNotificationParams,
  }) async {
    try {
      final result = await _sendPushNotificationDatasource(
        sendPushNotificationModel: SendPushNotificationModel.fromEntity(
          params: pushNotificationParams,
        ),
      );
      return Right(result);
    } on SendPushNotificationError catch (e, s) {
      log(
        'Erro ao enviar push notification no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(SendPushNotificationError(message: e.message));
    } catch (e, s) {
      log(
        'Erro ao enviar push notification no repository impl',
        error: e,
        stackTrace: s,
      );
      return Left(
        SendPushNotificationError(
            message: 'Erro interno ao enviar notificação, tente mais tarde'),
      );
    }
  }
}
