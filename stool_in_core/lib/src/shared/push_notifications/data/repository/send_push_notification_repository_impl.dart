import 'dart:developer';


import 'package:dartz/dartz.dart';

import '../../domain/entity/push_notification_params.dart';
import '../../domain/error/send_push_notification_error.dart';
import '../../domain/repository/send_push_notification_repository.dart';
import '../datasource/send_push_notification_datasource.dart';
import '../model/send_push_notification_model.dart';

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
