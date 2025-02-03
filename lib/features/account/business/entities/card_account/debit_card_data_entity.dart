import '../enums/bank_card_type_enum.dart';
import 'card_data_entity.dart';

/// Information of a debit card
class DebitCardDataEntity extends CardDataEntity {
  /// Information of a debit card
  const DebitCardDataEntity({
    super.type = BankCardTypeEnum.DEBIT,
    super.number,
    super.expirationDate,
    super.bank,
    super.issuer,
  });

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
