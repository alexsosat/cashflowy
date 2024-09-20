import "package:drift/drift.dart";

/// Table where the information of the bank will be stored
class BankTable extends Table {
  /// Unique identifier of the bank
  IntColumn get id => integer().autoIncrement()();

  /// Name of the bank
  TextColumn get name => text().withLength(min: 6, max: 32)();

  /// Color of the bank represented stored in hexadecimal value
  TextColumn get color => text().nullable().withLength(max: 7)();

  /// Logo of the bank
  TextColumn get logo => text().nullable()();

  /// Url of the bank
  TextColumn get url => text().nullable()();

  /// Description of the bank
  TextColumn get description => text().nullable()();
}
