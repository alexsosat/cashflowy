import "dart:ui";

import "package:equatable/equatable.dart";

/// Entity that contains the Bank values.
class BankEntity extends Equatable {
  /// Entity that contains the Bank values.
  const BankEntity({
    required this.id,
    required this.name,
    this.color,
    this.logo,
    this.url,
    this.description,
  });

  /// Unique identifier of the bank
  final int id;

  /// Name of the bank
  final String name;

  /// Color of the bank
  final Color? color;

  /// Logo of the bank
  final String? logo;

  /// Url of the bank
  final String? url;

  /// Description of the bank
  final String? description;

  @override
  List<Object?> get props => [
        id,
        name,
        color,
        logo,
        url,
        description,
      ];

  @override
  bool get stringify => true;
}
