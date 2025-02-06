import 'package:drift/drift.dart';

import 'card_table.dart';
import 'credit_loan_table.dart';

/// Relational table between the card and the credit card loan
class CardCreditRelTable extends Table {
  /// Foreign key to the card table
  late final cardId = integer().references(CardTable, #id)();

  /// Foreign key to the credit card loan table
  late final creditId = integer().references(CreditLoanTable, #id)();
}
