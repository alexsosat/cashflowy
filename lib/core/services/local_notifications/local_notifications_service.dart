import "dart:async";
import "dart:developer";
import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";

/// Local notification service to send notifications to the user
class LocalNotificationsService {
  /// Local notification service to send notifications to the user
  factory LocalNotificationsService() => _notificationsService;
  LocalNotificationsService._internal();

  static final _notificationsService = LocalNotificationsService._internal();

  ///The notifications service used to show notifications
  static final _notifications = FlutterLocalNotificationsPlugin();

  ///The android notification channel group
  static const AndroidNotificationChannelGroup androidNotificationChannelGroup =
      AndroidNotificationChannelGroup(
    "travex.onecard.mx",
    "Notificaciones de GoTravex",
    description: "Notificaciones enviadas por GoTravex",
  );

  ///The android notification channel
  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    "travex_push_notifications_service",
    "Notificaciones de GoTravex",
    description: "Notificaciones enviadas por GoTravex",
    importance: Importance.high,
    groupId: "travex.onecard.mx",
  );

  ///Initializes the local notifications service
  Future<void> initLocalNotificationsService() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@drawable/ic_notif_travex");

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notifications.initialize(initializationSettings);

    final platform = _notifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform
        ?.createNotificationChannelGroup(androidNotificationChannelGroup);

    await platform?.createNotificationChannel(channel);

    await platform?.requestNotificationsPermission();

    await platform?.requestExactAlarmsPermission();
  }

  //Returns the platform notification styles details
  static NotificationDetails _notificationDetails() => NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: channel.importance,
          color: Colors.blue,
          priority: Priority.high,
          groupKey: channel.groupId,
          styleInformation: const BigTextStyleInformation(""),
          // setAsGroupSummary: true,
        ),
        iOS: const DarwinNotificationDetails(
          threadIdentifier: "travex.onecard.mx",
        ),
      );

  /// Cancels all the notifications pending
  static Future cancelAllNotifications() => _notifications.cancelAll();

  /// Cancels a notification by its id
  static Future cancelNotification(int id) => _notifications.cancel(id);

  ///Shows a toolbar notification
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    log("Showing notification: $id");

    await _notifications.show(
      id,
      title,
      body,
      _notificationDetails(),
      payload: payload,
    );

    if (Platform.isAndroid) {
      await _groupNotifications();
    }
  }

  ///Groups all the notifications
  ///This is used to show the notifications as a group
  // ignore: unused_element
  static Future _groupNotifications() async {
    final activeNotifications = await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.getActiveNotifications();
    if (activeNotifications != null && activeNotifications.length > 1) {
      final lines = activeNotifications.map((e) => e.body.toString()).toList();
      final inboxStyleInformation = InboxStyleInformation(
        lines,
        contentTitle: activeNotifications.first.title,
        summaryText: "Notificaciones sin leer",
      );
      final groupDetails = AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        styleInformation: inboxStyleInformation,
        setAsGroupSummary: true,
        color: Colors.blue,
        groupKey: channel.groupId,
      );

      log("Grouping notifications: ${activeNotifications.length}");

      await _notifications.show(
        0,
        "",
        "",
        NotificationDetails(
          android: groupDetails,
        ),
      );
    }
  }
}
