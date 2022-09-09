import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel androidNotificationChannel;
  LocalNotifications() {
    androidNotificationChannel = const AndroidNotificationChannel(
      'high_importance_channel',
      'high_importance_notifications',
      description: 'channel used for very important notifications',
      importance: Importance.max,
    );
    _androidConfig().then(
      (value) {
        flutterLocalNotificationsPlugin = value;
        initializeNotifications();
      },
    );
    _iosConfig().then((value) {
      flutterLocalNotificationsPlugin = value;
      initializeNotifications();
    });
  }

  Future<FlutterLocalNotificationsPlugin> _androidConfig() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
    return flutterLocalNotificationsPlugin;
  }

  Future<FlutterLocalNotificationsPlugin> _iosConfig() async {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    return flutterLocalNotificationsPlugin;
  }

  void initializeNotifications() {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = IOSInitializationSettings(
      // onDidReceiveLocalNotification: ,
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
    flutterLocalNotificationsPlugin
        .initialize(const InitializationSettings(android: android, iOS: ios));
  }

  void androidNotifications({
    required RemoteNotification notification,
    required AndroidNotification? androidNotification,
  }) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
            androidNotificationChannel.id, androidNotificationChannel.name,
            channelDescription: androidNotificationChannel.description,
            icon: androidNotification?.smallIcon),
      ),
    );
  }

  void iosNotifications({
    required RemoteNotification notification,
    required AppleNotification? iosNotification,
  }) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      const NotificationDetails(
        iOS: IOSNotificationDetails(),
      ),
    );
  }
}