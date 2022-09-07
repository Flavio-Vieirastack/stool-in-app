import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';


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
