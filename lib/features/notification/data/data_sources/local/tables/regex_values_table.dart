import 'package:drift/drift.dart';

import 'app_regex_table.dart';

/// Table for storing the regex to get the values of the notifications
/// belonging to the app
class RegexValuesTable extends Table {
  /// Unique identifier for the notification
  IntColumn get id => integer().autoIncrement()();

  /// Title for the notification
  TextColumn get titleRegex => text().nullable()();

  /// Trigger word for the regex search
  TextColumn get triggerText => text().nullable()();

  /// Regex to extract the amount from the notification
  TextColumn get amountRegex => text().nullable()();

  /// Regex to extract the merchant from the notification
  TextColumn get merchantRegex => text().nullable()();

  /// Adds a reference for the regex info that this values belongs to
  IntColumn get regexInfo => integer().references(AppRegexTable, #id)();
}
