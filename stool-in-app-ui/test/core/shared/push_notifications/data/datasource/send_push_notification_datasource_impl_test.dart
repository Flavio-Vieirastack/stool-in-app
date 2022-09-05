import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/rest_client/rest_client_contracts.dart';
import 'package:stool_in/core/rest_client/rest_client_response.dart';
import 'package:stool_in/core/shared/push_notifications/data/datasource/send_push_notification_datasource.dart';
import 'package:stool_in/core/shared/push_notifications/data/datasource/send_push_notification_datasource_impl.dart';
import 'package:stool_in/core/shared/push_notifications/data/model/send_push_notification_model.dart';
import 'package:stool_in/core/shared/push_notifications/domain/error/send_push_notification_error.dart';

class _RestCLientPostMock extends Mock implements RestClientPost {}

void main() {
  late _RestCLientPostMock restCLientPostMock;
  late SendPushNotificationDatasource sendPushNotificationDatasource;
  late SendPushNotificationModel sendPushNotificationModel;
  setUp(() {
    restCLientPostMock = _RestCLientPostMock();
    sendPushNotificationDatasource =
        SendPushNotificationDatasourceImpl(restClientPost: restCLientPostMock);
    sendPushNotificationModel = SendPushNotificationModel(
      pushToken: 'pushToken',
      title: 'title',
      body: 'body',
    );
  });
  test('Deve retornar true quando enviar push notification no datasource impl',
      () async {
    when(
      () => restCLientPostMock.post(
        path: any(named: 'path'),
        data: sendPushNotificationModel.toMap(),
      ),
    ).thenAnswer((invocation) async => RestClientResponse(statucCode: 200));
    final sut = await sendPushNotificationDatasource.call(
        sendPushNotificationModel: sendPushNotificationModel);
    expect(sut, true);
  });
  test(
      'Deve chamar o restclient post ao retornar true quando enviar push notification no datasource impl',
      () async {
    when(
      () => restCLientPostMock.post(
        path: any(named: 'path'),
        data: sendPushNotificationModel.toMap(),
      ),
    ).thenAnswer((invocation) async => RestClientResponse(statucCode: 200));
    final sut = await sendPushNotificationDatasource.call(
        sendPushNotificationModel: sendPushNotificationModel);
    expect(sut, true);
    verify(
      () => restCLientPostMock.post(
          path: any(named: 'path'), data: sendPushNotificationModel.toMap()),
    ).called(1);
  });
  test(
      'Deve retornar um erro quando enviar push notification no datasource impl',
      () async {
    when(
      () => restCLientPostMock.post(
        path: any(named: 'path'),
        data: sendPushNotificationModel.toMap(),
      ),
    ).thenThrow(SendPushNotificationError(message: 'message'));
    final sut = sendPushNotificationDatasource.call;
    expect(
        () async => sut(sendPushNotificationModel: sendPushNotificationModel),
        throwsA(isA<SendPushNotificationError>()));
  });
}
