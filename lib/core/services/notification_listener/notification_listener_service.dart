import "dart:isolate";
import "dart:ui";

import "package:flutter_notification_listener/flutter_notification_listener.dart";
import "package:get_it/get_it.dart";

import "../../../features/notification/notification.dart";
import "../database/app_database.dart";

/// Class to listen to notifications
///
/// This class listens to the notifications and performs the actions
/// based on the notifications received
///
/// This only applies to Android devices
class NotificationListenerService {
  /// Initialize the notification listener service
  static Future init() async {
    await NotificationsListener.initialize(callbackHandle: _backgroundCallback);

    final ReceivePort port = ReceivePort();

    IsolateNameServer.removePortNameMapping("_listener_");
    IsolateNameServer.registerPortWithName(port.sendPort, "_listener_");

    port.listen(onFrontData);

    await _startListening();
  }

  static Future _startListening() async {
    print("start listening");
    final hasPermission = await NotificationsListener.hasPermission;

    if (!(hasPermission ?? false)) {
      print("no permission, so open settings");

      await NotificationsListener.openPermissionSettings();
    }

    final isRunning = await NotificationsListener.isRunning;

    if (!(isRunning ?? false)) {
      await NotificationsListener.startService(
        foreground: true,
        title: "Notification Listener",
        description: "Listening to notifications",
      );
    }
  }

  /// Event triggered when a notification is received
  static void onFrontData(dynamic data) {
    print("Front event: ${data.toString()}");
  }

  @pragma("vm:entry-point")
  static Future _backgroundCallback(NotificationEvent evt) async {
    // persist data immediately
    late AppDatabase db;

    try {
      db = GetIt.I.get<AppDatabase>();
    } catch (e) {
      db = await constructDb();
    }

    final notificationRepository = NotificationRepositoryImpl(
      localDataSource: NotificationLocalDataSourceImpl(
        localSource: db,
      ),
    );

    final appNotificationRepository = AppNotificationRepositoryImpl(
      localDataSource: AppNotificationLocalDataSourceImpl(
        localSource: db,
      ),
    );

    await SaveNotificationUseCase(
      notificationRepository: notificationRepository,
      appNotificationRepository: appNotificationRepository,
    ).call(
      params: SaveNotificationParams(
        appPackageName: evt.packageName ?? "Uknown",
        appIcon: evt.largeIcon,
        title: evt.title ?? "",
        description: evt.text ?? "",
        date: evt.timestamp != null
            ? DateTime.fromMicrosecondsSinceEpoch(evt.timestamp!)
            : DateTime.now(),
        infoText: evt.raw?["infoText"],
        bigText: evt.raw?["bigText"],
        subText: evt.raw?["subText"],
      ),
    );

    // send data to ui thread if necessary.
    // try to send the event to ui
    print("send evt to ui: $evt");
    final SendPort? send = IsolateNameServer.lookupPortByName("_listener_");
    if (send == null) print("can't find the sender");
    send?.send(evt);
  }
}
