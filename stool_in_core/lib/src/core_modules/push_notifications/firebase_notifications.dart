import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stool_in_core/src/core_modules/push_notifications/local_notifications.dart';

class FireBaseNotifications {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final LocalNotifications _localNotifications;

  FireBaseNotifications._internal(this._localNotifications);
  static final FireBaseNotifications _singleton =
      FireBaseNotifications._internal(LocalNotifications());
  factory FireBaseNotifications() => _singleton;

  Future<void> initializeFirebasePushServices() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            badge: true, sound: true, alert: true);

    FirebaseMessaging.onMessage.listen(
      (push) {
        RemoteNotification? notification = push.notification;
        AndroidNotification? androidNotification = push.notification?.android;
        AppleNotification? iosNotification = push.notification?.apple;

        if (notification != null && androidNotification != null) {
          _localNotifications.androidNotifications(
            notification: notification,
            androidNotification: androidNotification,
          );
        }
        if (notification != null && iosNotification != null) {
          _localNotifications.iosNotifications(
            notification: notification,
            iosNotification: iosNotification,
          );
        }
      },
    );
    if (Platform.isIOS) {
      FirebaseMessaging.onMessageOpenedApp.listen(
        (route) {
          if (route.data['goTo'] != null) {
            navigatorKey.currentState?.pushNamed(route.data['goTo']);
          }
        },
      );
    }
    if (Platform.isAndroid) {
      FirebaseMessaging.onMessageOpenedApp.listen(
        (route) {
          if (route.data['goTo'] != null) {
            navigatorKey.currentState?.pushNamed(route.data['goTo']);
          }
        },
      );
    }
  }

  Future<String?> getTokenFirebase() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint(token);
    return token;
  }

  Future<void> refreshTokenFirebase({
    required Function(String) updateToken,
  }) async {
    FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
      log('Token refreshed');
      await updateToken.call(token);
    });
  }
}
