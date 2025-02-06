import 'package:drift/drift.dart';

import '../issuer/issuer_table.dart';
import 'card_table.dart';

/// Relational table between the card and the issuer
class CardIssuerRelTable extends Table {
  /// Foreign key to the card table
  late final cardId = integer().references(CardTable, #id)();

  /// Foreign key to the issuer table
  late final issuerId = integer().references(IssuerTable, #id)();
}
