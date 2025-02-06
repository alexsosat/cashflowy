import 'package:drift/drift.dart';

import '../../../../../../logo/data/data_sources/local/tables/logo_table.dart';
import 'bank_table.dart';

/// Relational table between the bank and the logo
class BankLogoRel extends Table {
  /// Foreign key to the bank table
  late final bankId = integer().references(BankTable, #id)();

  /// Foreign key to the logo table
  late final logoId = integer().references(LogoTable, #id)();
}
