import 'dart:developer';


import 'package:stool_in_core/src/shared/push_notifications/data/datasource/send_push_notification_datasource.dart';

import '../../../../constants/endpoint_constants.dart';
import '../../../../rest_client/error/rest_client_exception.dart';
import '../../../../rest_client/rest_client_contracts.dart';
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
