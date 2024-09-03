import "../../../../../core/extensions/color_extension.dart";
import "../../../../../core/services/database/app_database.dart";
import "../../../business/entities/account_entity.dart";

/// Model that transforms the Account data from the API to the
/// application entity
class AccountModel extends AccountEntity {
  /// Model that transforms the Account data from the API to the
  /// application entity
  const AccountModel({
    required super.id,
    required super.name,
    required super.color,
    required super.type,
    required super.currency,
  });

  /// Factory method to create an account model instance from a Drift [AccountItem]
  factory AccountModel.fromDrift({
    required AccountItem account,
  }) =>
      AccountModel(
        id: account.id,
        name: account.name,
        color: ColorExtension.fromHex(account.color),
        type: account.type,
        currency: account.currency,
      );
}
