import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stool_in/core/shared/push_notifications/domain/entity/push_notification_params.dart';
import 'package:stool_in/core/shared/push_notifications/domain/error/send_push_notification_error.dart';
import 'package:stool_in/core/shared/push_notifications/domain/repository/send_push_notification_repository.dart';
import 'package:stool_in/core/shared/push_notifications/domain/usecase/send_push_notification_usecase.dart';
import 'package:stool_in/core/shared/push_notifications/domain/usecase/send_push_notification_usecase_impl.dart';

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
