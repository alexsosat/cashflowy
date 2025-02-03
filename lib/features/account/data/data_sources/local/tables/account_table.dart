import "package:drift/drift.dart";

import "../../../../business/entities/enums/account_type_enum.dart";

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
  IntColumn get type =>
      intEnum<AccountTypeEnum>().withDefault(const Constant(0))();

  /// Currency of the account
  ///
  /// This value is stored as the minified expression of the currency
  /// Eg. mxn, usd
  TextColumn get currency => text().withLength(max: 12)();
}
