import "package:drift/drift.dart";

import "app_notification_table.dart";

/// Table that stores the incoming notifications on the device
class NotificationTable extends Table {
  /// Unique identifier for the notification
  IntColumn get id => integer().autoIncrement()();

  /// Title of the notification
  TextColumn get title => text()();

  /// Description of the notification
  TextColumn get description => text()();

  /// Time when the notification was received
  DateTimeColumn get time => dateTime()();

  /// Adds a reference for the app that the notification belongs to
  IntColumn get appId => integer().references(AppNotificationTable, #id)();

  /// True if the notification matches a regex
  BoolColumn get hasRegexMatch =>
      boolean().withDefault(const Constant(false))();

  /// Info text of the notification
  TextColumn get infoText => text().nullable()();

  /// Big text of the notification
  TextColumn get bigText => text().nullable()();

  /// Sub text of the notification
  TextColumn get subText => text().nullable()();
}
