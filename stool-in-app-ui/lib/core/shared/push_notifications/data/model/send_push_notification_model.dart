

import '../../domain/entity/push_notification_params.dart';

class SendPushNotificationModel extends PushNotificationParams {
  SendPushNotificationModel({
    required super.pushToken,
    required super.title,
    required super.body,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SendPushNotificationModel &&
        other.pushToken == pushToken &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode => pushToken.hashCode ^ title.hashCode ^ body.hashCode;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'token': pushToken});
    result.addAll({'title': title});
    result.addAll({'body': body});

    return result;
  }

  factory SendPushNotificationModel.fromEntity({
    required PushNotificationParams params,
  }) {
    return SendPushNotificationModel(
      pushToken: params.pushToken,
      title: params.title,
      body: params.body,
    );
  }
}
