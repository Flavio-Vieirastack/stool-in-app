import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in_core/stool_in_core.dart';


class _SendPushNotificationsRepositoryMock extends Mock
    implements SendPushNotificationRepository {}

class _PushParams extends Mock implements PushNotificationParams {}

void main() {
  late _SendPushNotificationsRepositoryMock sendPushNotificationsRepositoryMock;
  late _PushParams pushParams;
  late SendPushNotificationUsecase sendPushNotificationUsecase;
  setUp(() {
    sendPushNotificationsRepositoryMock =
        _SendPushNotificationsRepositoryMock();
    pushParams = _PushParams();
    sendPushNotificationUsecase = SendPushNotificationUsecaseImpl(
        sendPushNotificationRepository: sendPushNotificationsRepositoryMock);
  });
  test('Deve retornar true ao enviar uma push notification com sucesso',
      () async {
    when(
      () => sendPushNotificationsRepositoryMock.call(
          pushNotificationParams: pushParams),
    ).thenAnswer((_) async => const Right(true));
    final sut =
        await sendPushNotificationUsecase(pushNotificationParams: pushParams);
    expect(sut, const Right(true));
  });
  test(
      'Deve chamar o repository ao retornar true ao enviar uma push notification com sucesso',
      () async {
    when(
      () => sendPushNotificationsRepositoryMock.call(
          pushNotificationParams: pushParams),
    ).thenAnswer((_) async => const Right(true));
    final sut =
        await sendPushNotificationUsecase(pushNotificationParams: pushParams);
    expect(sut, const Right(true));
    verify(
      () => sendPushNotificationsRepositoryMock.call(
          pushNotificationParams: pushParams),
    ).called(1);
  });
  test('Deve retornar um erro ao enviar uma push notification com sucesso',
      () async {
    when(
      () => sendPushNotificationsRepositoryMock.call(
          pushNotificationParams: pushParams),
    ).thenAnswer(
        (_) async => Left(SendPushNotificationError(message: 'message')));
    final sut =
        await sendPushNotificationUsecase(pushNotificationParams: pushParams);
    expect(sut, Left(SendPushNotificationError(message: 'message')));
  });
}
