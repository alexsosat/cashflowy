import 'package:drift/drift.dart';

import '../bank/bank_table.dart';
import 'card_table.dart';

/// Relational table between the card and the bank
class CardBankRelTable extends Table {
  /// Foreign key to the card table
  late final cardId = integer().references(CardTable, #id)();

  /// Foreign key to the bank table
  late final bankId = integer().references(BankTable, #id)();
}
