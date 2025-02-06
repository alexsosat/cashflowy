import 'package:drift/drift.dart';

/// This is the table where the bank information will be stored
class BankTable extends Table {
  /// Unique identifier of the bank
  late final id = integer().autoIncrement()();

  /// Name of the bank
  late final name = text().withLength(min: 1, max: 50)();

  /// App bundle of the bank
  late final appBundle = text().withLength(min: 1, max: 100)();
}
