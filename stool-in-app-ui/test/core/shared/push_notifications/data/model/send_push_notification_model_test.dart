import 'package:flutter_test/flutter_test.dart';
import 'package:stool_in/core/shared/push_notifications/data/model/send_push_notification_model.dart';

void main() {
  test('Deve retornar o valore correto para push token', () async {
    final model = SendPushNotificationModel(
            pushToken: 'pushToken', title: 'title', body: 'body')
        .toMap();
    final sut = model['token'];
    const matcher = 'pushToken';
    expect(sut, matcher);
  });
  test('Deve retornar o valore correto para title', () async {
    final model = SendPushNotificationModel(
            pushToken: 'pushToken', title: 'title', body: 'body')
        .toMap();
    final sut = model['title'];
    const matcher = 'title';
    expect(sut, matcher);
  });
  test('Deve retornar o valore correto para body', () async {
    final model = SendPushNotificationModel(
            pushToken: 'pushToken', title: 'title', body: 'body')
        .toMap();
    final sut = model['body'];
    const matcher = 'body';
    expect(sut, matcher);
  });
}
