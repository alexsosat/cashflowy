import "package:drift/drift.dart";

/// Table for storing the apps that sends the notifications to the device
class AppNotificationTable extends Table {
  /// Unique identifier for the app
  IntColumn get id => integer().autoIncrement()();

  /// Package name of the application that sent the notification
  TextColumn get packageName => text()();

  /// Icon of the application that sent the notification
  BlobColumn get icon => blob().nullable()();

  /// True if the app must save the notifications of this app
  BoolColumn get saveNotifications =>
      boolean().withDefault(const Constant(true))();
}
