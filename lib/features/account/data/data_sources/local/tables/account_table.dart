import "package:drift/drift.dart";

import "../../../../business/entities/enums/account_type_enum.dart";

/// This is the table where the account information will be stored
class AccountTable extends Table {
  /// Unique identifier of the account
  late final id = integer().autoIncrement()();

  /// Name of the account
  late final name = text().withLength(min: 4, max: 64)();

  /// Color of the account represented stored in hexadecimal value
  late final color = text().withLength(max: 7)();

  /// Currency of the account
  ///
  /// This value is stored as the minified expression of the currency
  /// Eg. mxn, usd
  late final currency = text().withLength(max: 8)();

  /// Type of account
  ///
  /// This value is stored as an int and the drift packages makes the conversion to an enum
  late final typeId =
      intEnum<AccountTypeEnum>().withDefault(const Constant(0))();
}
