class PushNotificationParams {
  final String pushToken;
  final String title;
  final String body;
  PushNotificationParams({
    required this.pushToken,
    required this.title,
    required this.body,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PushNotificationParams &&
        other.pushToken == pushToken &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode => pushToken.hashCode ^ title.hashCode ^ body.hashCode;
}
