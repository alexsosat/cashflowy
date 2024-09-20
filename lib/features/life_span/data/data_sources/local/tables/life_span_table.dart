import "package:drift/drift.dart";

import "../../../../business/entities/life_span_units.dart";

/// Table to store the life span of expirable items
class LifeSpanTable extends Table {
  /// Unique identifier of the life span
  IntColumn get id => integer().autoIncrement()();

  /// Unit measurement of the life span
  IntColumn get unit => intEnum<LifeSpanUnits>()();

  /// Value of the life span
  IntColumn get value => integer()();

  /// Expiration date of the life span
  ///
  /// Null if the life span is infinite
  DateTimeColumn get expirationDate => dateTime().nullable()();
}
