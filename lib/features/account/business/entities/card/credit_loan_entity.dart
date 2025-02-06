import 'package:equatable/equatable.dart';

/// Information of a credit loan
class CreditLoanEntity extends Equatable {
  /// Information of a credit loan
  const CreditLoanEntity({
    required this.amountLimit,
    required this.mothlyInterestRate,
    required this.statementClosingDay,
    required this.statementPaymentDay,
  });

  /// Limit of the credit loan
  final double amountLimit;

  /// Interest rate of the credit loan
  final double mothlyInterestRate;

  /// Statement closing day
  final DateTime statementClosingDay;

  /// Statement payment day
  final DateTime statementPaymentDay;

  @override
  List<Object?> get props => [
        amountLimit,
        mothlyInterestRate,
        statementClosingDay,
        statementPaymentDay,
      ];

  @override
  bool get stringify => true;
}
