import 'package:equatable/equatable.dart';

import '../../../../logo/business/entities/logo_entity.dart';

/// Information of a card issuer
class IssuerEntity extends Equatable {
  /// Information of a card issuer
  const IssuerEntity({
    required this.name,
    required this.logo,
  });

  /// Name of the bank
  final String name;

  /// Logo of the bank
  final LogoEntity logo;

  @override
  List<Object?> get props => [
        name,
        logo,
      ];

  @override
  bool get stringify => true;
}
