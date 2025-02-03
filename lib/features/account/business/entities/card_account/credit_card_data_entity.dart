import '../enums/bank_card_type_enum.dart';
import 'card_data_entity.dart';
import 'credit_loan_entity.dart';

/// Information of a credit card
class CreditCardDataEntity extends CardDataEntity {
  /// Information of a credit card
  const CreditCardDataEntity({
    required this.loan,
    super.type = BankCardTypeEnum.CREDIT,
    super.number,
    super.expirationDate,
    super.bank,
    super.issuer,
  });

  /// Information of the loan
  final CreditLoanEntity loan;

  @override
  List<Object?> get props => [
        type,
        number,
        expirationDate,
        bank,
        issuer,
      ];

  @override
  bool get stringify => true;
}
