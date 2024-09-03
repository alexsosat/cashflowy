import "dart:ui";

import "package:equatable/equatable.dart";

import "account_type.dart";

/// Entity that contains the data of the Account.
class AccountEntity extends Equatable {
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
  final AccountType type;

  /// Currency of the account
  final String currency;

  @override
  List<Object?> get props => [
        id,
        name,
        color,
        type,
        currency,
      ];

  @override
  bool get stringify => true;
}
