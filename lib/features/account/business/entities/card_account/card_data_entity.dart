import 'package:equatable/equatable.dart';

import '../enums/bank_card_type_enum.dart';
import 'bank_entity.dart';
import 'issuer_entity.dart';

/// Information of a bank card
abstract class CardDataEntity extends Equatable {
  /// Information of a bank card
  const CardDataEntity({
    required this.type,
    this.number,
    this.expirationDate,
    this.bank,
    this.issuer,
  });

  /// Card Type
  final BankCardTypeEnum type;

  /// Last 4 digits of the card number
  final String? number;

  /// Expiration date of the card
  final DateTime? expirationDate;

  /// Information of the bank that issued the card
  final BankEntity? bank;

  /// Information of the issuer of the card
  final IssuerEntity? issuer;
}
