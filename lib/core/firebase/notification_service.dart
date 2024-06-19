import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../src/main_index.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    "High Importance Notifications", // title
    enableVibration: true,
    importance: Importance.max,
    playSound: true,
    showBadge: true,
    sound: RawResourceAndroidNotificationSound('selfie_notification'),
    description: "Notifications for Selfie users");

final FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('onBackgroundMessage: ${message.data}');
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);
}

class FirebaseNotification {
  String? firebaseNotificationToken;

  bool get mounted => false;

  initialize(BuildContext context) async {
    await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await flutterLocalNotificationPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializeSettingIOS = DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializeSettingIOS);

    flutterLocalNotificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) async {
        if (payload.payload != null) {
          Map<String, dynamic> message = jsonDecode(payload.payload!);
          print('onSelectNotification: $message');
        }
      },
    );

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationPlugin.getNotificationAppLaunchDetails();
    String? payload =
        notificationAppLaunchDetails?.notificationResponse?.payload;
    if (payload != null && payload.isNotEmpty) {
      print('payload: $payload');
      final data = jsonDecode(payload);
      if (mounted) return;
      //    setRouteFromNotificationData(context: context, data: data);
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);

    await getToken();
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      print('getInitialMessage: $message');
      print('getInitialMessage data: ${message?.data}');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('onMessage data: ${message.data}');
      RemoteNotification? notification = message.notification;
      // AndroidNotification? android = message.notification?.android;
      if (notification != null) {
        flutterLocalNotificationPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                // TODO add a proper drawable resource to android, for now using
                // one that already exists in example app.
                icon: '@mipmap/ic_launcher',
              ),
            ),
            // Add reading of a payload based on the contents of notification
            // In my case:
            payload: jsonEncode(message.data));
        // Navigators.pushNamed(message.data['type']);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      print('onMessageOpenedApp: ${message.data}');
      print('onMessageOpenedApp: ${message.notification}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
    });
  }

  // FirebaseMessaging.
  // Future<void> routeFromNotificationMessage(
  //     BuildContext context, RemoteMessage message) async {
  //   print('routeFromNotificationMessage');
  //   setRouteFromNotificationData(context: context, data: message.data);
  // }

// support ticket

  Future<String?> getToken() async {
    print('get token called');
    String? firebaseToken = await FirebaseMessaging.instance.getToken();
    firebaseNotificationToken = firebaseToken;
    if (kDebugMode) {
      print('firebaseToken $firebaseToken');
    }
    return firebaseToken;
  }

  Future<void> removeToken() async {
    await FirebaseMessaging.instance.deleteToken();
  }

  static NotificationDetails _notificationDetails() {
    print('_notificationDetails');
    return NotificationDetails(
        android: AndroidNotificationDetails(channel.id, channel.name,
            channelDescription: channel.description,
            importance: Importance.max,
            priority: Priority.high),
        iOS: const DarwinNotificationDetails());
  }

  subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }
}