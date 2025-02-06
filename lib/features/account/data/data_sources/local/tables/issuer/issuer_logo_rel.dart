import 'package:drift/drift.dart';

import '../../../../../../logo/data/data_sources/local/tables/logo_table.dart';
import 'issuer_table.dart';

/// Relational table between the issuer and the logo
class IssuerLogoRel extends Table {
  /// Foreign key to the issuer table
  late final issuerId = integer().references(IssuerTable, #id)();

  /// Foreign key to the logo table
  late final logoId = integer().references(LogoTable, #id)();
}
