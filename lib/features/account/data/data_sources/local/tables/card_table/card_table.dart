import "package:drift/drift.dart";

import "../../../../../business/entities/enums/bank_card_type_enum.dart";

/// This is the table where the card information will be stored
class CardTable extends Table {
  /// Unique identifier of the card
  late final id = integer().autoIncrement()();

  /// Number of the card
  late final number = text().withLength(min: 16, max: 16)();

  /// Type of account
  ///
  /// This value is stored as an int and the drift packages makes the conversion to an enum
  late final typeId =
      intEnum<BankCardTypeEnum>().withDefault(const Constant(0))();
}
