import "package:drift/drift.dart";

import "../../../../../account/data/data_sources/local/tables/account_table.dart";

/// Table to store the information of an account report
class AccountReportTable extends Table {
  /// Unique identifier of the bank
  IntColumn get id => integer().autoIncrement()();

  /// Initial money of the account
  RealColumn get initialMoney => real()();

  /// Start date of the report
  DateTimeColumn get startDate => dateTime()();

  /// End date of the report
  DateTimeColumn get endDate => dateTime()();

  /// Adds a reference for the account that the report belongs to
  IntColumn get accountId => integer().references(AccountTable, #id)();
}
