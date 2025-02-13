import 'package:drift/drift.dart';

import 'app_notification_table.dart';

/// Table for storing the base information for a notification regex trigger
class AppRegexTable extends Table {
  /// Unique identifier for the notification
  IntColumn get id => integer().autoIncrement()();

  /// True if the regex is used for purchases
  /// False if the regex is used for incomes
  BoolColumn get isPurchase => boolean().withDefault(const Constant(false))();

  /// Adds a reference for the app that this regex belongs to
  IntColumn get appId => integer().references(AppNotificationTable, #id)();
}
