import "package:drift/drift.dart";

import "account_table.dart";
import "card_table/card_table.dart";

/// Relational table between the account and the card
class AccountCardRelTable extends Table {
  /// Foreign key to the account table
  late final accountId = integer().references(AccountTable, #id)();

  /// Foreign key to the card table
  late final cardId = integer().references(CardTable, #id)();
}
