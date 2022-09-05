import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/shared/push_notifications/data/datasource/send_push_notification_datasource.dart';
import 'package:stool_in/core/shared/push_notifications/data/model/send_push_notification_model.dart';
import 'package:stool_in/core/shared/push_notifications/data/repository/send_push_notification_repository_impl.dart';
import 'package:stool_in/core/shared/push_notifications/domain/entity/push_notification_params.dart';
import 'package:stool_in/core/shared/push_notifications/domain/error/send_push_notification_error.dart';
import 'package:stool_in/core/shared/push_notifications/domain/repository/send_push_notification_repository.dart';

class _PushNotificationsDatasourceMock extends Mock
    implements SendPushNotificationDatasource {}

void main() {
  late PushNotificationParams pushParams;
  late _PushNotificationsDatasourceMock pushNotificationsDatasourceMock;
  late SendPushNotificationRepository sendPushNotificationRepository;
  setUp(() {
    pushParams = PushNotificationParams(
      pushToken: 'pushToken',
      title: 'title',
      body: 'body',
    );
    pushNotificationsDatasourceMock = _PushNotificationsDatasourceMock();
    sendPushNotificationRepository = SendPushNotificationRepositoryImpl(
        sendPushNotificationDatasource: pushNotificationsDatasourceMock);
    registerFallbackValue(
      SendPushNotificationModel.fromEntity(
        params: pushParams,
      ),
    );
  });
  test('Deve retornar true ao mandar uma push notification no repository impl',
      () async {
    when(
      () => pushNotificationsDatasourceMock.call(
          sendPushNotificationModel: any(named: 'sendPushNotificationModel')),
    ).thenAnswer((_) async => true);
    final sut = await sendPushNotificationRepository(
        pushNotificationParams: pushParams);
    expect(sut, const Right(true));
  });
  test(
      'Deve chamar o datasource ao retornar true ao mandar uma push notification no repository impl',
      () async {
    when(
      () => pushNotificationsDatasourceMock.call(
          sendPushNotificationModel: any(named: 'sendPushNotificationModel')),
    ).thenAnswer((_) async => true);
    final sut = await sendPushNotificationRepository(
        pushNotificationParams: pushParams);
    expect(sut, const Right(true));
    verify(
      () => pushNotificationsDatasourceMock.call(
          sendPushNotificationModel: any(named: 'sendPushNotificationModel')),
    ).called(1);
  });
  test(
      'Deve retornar um erro ao mandar uma push notification no repository impl',
      () async {
    when(
      () => pushNotificationsDatasourceMock.call(
          sendPushNotificationModel: any(named: 'sendPushNotificationModel')),
    ).thenThrow(SendPushNotificationError(message: 'message'));
    final sut = await sendPushNotificationRepository(
        pushNotificationParams: pushParams);
    expect(sut, Left(SendPushNotificationError(message: 'message')));
  });
}
