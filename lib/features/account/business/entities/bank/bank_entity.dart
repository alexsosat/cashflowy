import 'package:equatable/equatable.dart';

import '../../../../logo/business/entities/logo_entity.dart';

/// Information of the bank that issues a card
class BankEntity extends Equatable {
  /// Information of the bank that issues a card
  const BankEntity({
    required this.name,
    required this.logo,
    this.appBundle,
  });

  /// Name of the bank
  final String name;

  /// Logo of the bank
  final LogoEntity logo;

  /// App Bundle name of the bank's app
  final String? appBundle;

  @override
  List<Object?> get props => [
        name,
        logo,
        appBundle,
      ];

  @override
  bool get stringify => true;
}
