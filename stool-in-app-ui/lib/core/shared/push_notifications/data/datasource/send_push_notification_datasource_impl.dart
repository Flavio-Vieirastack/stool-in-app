import 'dart:developer';

import 'package:stool_in/core/shared/push_notifications/data/datasource/send_push_notification_datasource.dart';
import 'package:stool_in/exports/app_exports.dart';

import '../../domain/error/send_push_notification_error.dart';
import '../model/send_push_notification_model.dart';

class SendPushNotificationDatasourceImpl
    implements SendPushNotificationDatasource {
  final RestClientPost _restClientPost;
  SendPushNotificationDatasourceImpl({
    required RestClientPost restClientPost,
  }) : _restClientPost = restClientPost;
  @override
  Future<bool> call({
    required SendPushNotificationModel sendPushNotificationModel,
  }) async {
    try {
      await _restClientPost.post(
        path: EndpointConstants.pushNotifications,
        data: sendPushNotificationModel.toMap(),
      );
      return true;
    } on RestClientException catch (e, s) {
      log(
        'Erro ao enviar push notification no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw SendPushNotificationError(
        message: 'Erro ao enviar notificação, tente mais tarde',
      );
    } on SendPushNotificationError catch (e, s) {
      log(
        'Erro mapeado ao enviar push notification no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw SendPushNotificationError(
        message: 'Erro ao enviar notificação, tente mais tarde',
      );
    } catch (e, s) {
      log(
        'Erro não mapeado ao enviar push notification no datasource impl',
        error: e,
        stackTrace: s,
      );
      throw SendPushNotificationError(
        message: 'Erro interno ao enviar notificação, tente mais tarde',
      );
    }
  }
}
