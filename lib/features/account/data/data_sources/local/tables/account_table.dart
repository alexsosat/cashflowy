import "package:drift/drift.dart";

import "../../../../../bank/data/data_sources/tables/bank_table.dart";
import "../../../../business/entities/account_type.dart";

/// This is the table where the account information will be stored
class AccountTable extends Table {
  /// Unique identifier of the account
  IntColumn get id => integer().autoIncrement()();

  /// Name of the account
  TextColumn get name => text().withLength(min: 6, max: 32)();

  /// Color of the account represented stored in hexadecimal value
  TextColumn get color => text().nullable().withLength(max: 7)();

  /// Type of account
  ///
  /// This value is stored as an int and the drift packages makes the conversion to an enum
  IntColumn get type => intEnum<AccountType>().withDefault(const Constant(0))();

  /// Currency of the account
  ///
  /// This value is stored as the minified expression of the currency
  /// Eg. mxn, usd
  TextColumn get currency => text().withLength(max: 12)();

  /// Adds a reference for the bank that the account belongs to
  IntColumn get bankId => integer().nullable().references(BankTable, #id)();
}
