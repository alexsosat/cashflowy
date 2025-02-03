import "dart:ui";

import "package:equatable/equatable.dart";

import "enums/account_type_enum.dart";

/// Entity that contains the data of the Account.
abstract class AccountEntity extends Equatable {
  /// Entity that contains the data of the Account.
  const AccountEntity({
    required this.id,
    required this.name,
    required this.color,
    required this.type,
    required this.currency,
  });

  /// Unique identifier of the account
  final int id;

  /// Name of the account
  final String name;

  /// Color of the account
  final Color? color;

  /// Type of account
  final AccountTypeEnum type;

  /// Currency of the account
  final String currency;
}
