import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';


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
