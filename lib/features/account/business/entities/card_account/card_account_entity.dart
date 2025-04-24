import '../account_entity.dart';
import '../card/card_data_entity.dart';
import '../enums/account_type_enum.dart';

/// Entity that contains the data of an account related to a bank card
class CardAccountEntity extends AccountEntity {
  /// Entity that contains the data of an account related to a bank card
  const CardAccountEntity({
    required super.id,
    required super.name,
    required super.currency,
    required this.cardData,
    super.color,
    super.type = AccountTypeEnum.CARD,
  });

  /// Entity that contains the data of the card
  final CardDataEntity cardData;

  @override
  List<Object?> get props => [
        id,
        name,
        currency,
        cardData,
        color,
        type,
      ];

  @override
  bool get stringify => true;
}
