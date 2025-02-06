import 'package:drift/drift.dart';

/// This is the table where the issuer information will be stored
class IssuerTable extends Table {
  /// Unique identifier of the issuer
  late final id = integer().autoIncrement()();

  /// Name of the issuer
  late final name = text().withLength(min: 1, max: 50)();
}
