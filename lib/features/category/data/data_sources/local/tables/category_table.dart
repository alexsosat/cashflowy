import "package:drift/drift.dart";

/// Table to store the categories to be used in the app
class CategoryTable extends Table {
  /// Unique identifier of the category
  IntColumn get id => integer().autoIncrement()();

  /// Name of the category
  TextColumn get name => text()();

  /// Color of the category
  ///
  /// Saved as a hexadecimal value
  TextColumn get color => text()();

  /// Icon of the category
  ///
  /// Saved as code point of the icon
  IntColumn get icon => integer()();

  /// Indicates the default nature of the category
  ///
  /// True if it is an expense, false otherwise
  BoolColumn get isExpense => boolean()();
}
