import 'package:drift/drift.dart';

/// This is the table where the credit loan information will be stored
class CreditLoanTable extends Table {
  /// Unique identifier of the credit loan
  late final id = integer().autoIncrement()();

  /// Amount of the credit loan
  late final amount = real()();

  /// Monthly interest rate of the credit loan
  late final monthlyInterestRate = real()();

  /// Statement date of the credit loan
  late final statementClosingDate = dateTime()();

  /// Payment date of the credit loan
  late final statementPaymentDate = dateTime()();
}
