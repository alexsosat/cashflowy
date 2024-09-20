import "package:drift/drift.dart";

import "../../../../../category/data/data_sources/local/tables/category_table.dart";
import "../../../../../life_span/data/data_sources/local/tables/life_span_table.dart";
import "../../../../../report/data/data_sources/local/tables/account_report_table.dart";
import "../../../../business/entities/transaction_types.dart";

/// Table to store the transactions made by the user
class TransactionTable extends Table {
  /// Unique identifier of the transaction
  IntColumn get id => integer().autoIncrement()();

  /// Amount of the transaction
  RealColumn get amount => real()();

  /// Date of the transaction
  DateTimeColumn get paymentDate => dateTime()();

  /// Description of the transaction
  TextColumn get title => text().withLength(min: 1, max: 30)();

  /// Indicates the type of the transaction
  IntColumn get type => intEnum<TransactionTypes>()();

  /// Action of the transaction
  ///
  /// True if is expense, false if is income
  BoolColumn get isExpense => boolean()();

  /// True if the transaction is approved, false if is pending
  BoolColumn get isApproved => boolean()();

  /// Adds a reference for the category that the transaction belongs to
  IntColumn get categoryId => integer().references(CategoryTable, #id)();

  /// Adds a reference for the account report that the transaction belongs to
  IntColumn get accountReportId =>
      integer().references(AccountReportTable, #id)();

  /// Adds a reference for the life span that the transaction belongs to
  ///
  /// This is used for recurring transactions, null for other transaction types
  IntColumn get lifeSpanId =>
      integer().nullable().references(LifeSpanTable, #id)();

  /// Description of the transaction
  TextColumn get description => text().nullable()();
}
