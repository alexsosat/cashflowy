import "../../../../../core/extensions/color_extension.dart";
import "../../../../../core/services/database/app_database.dart";
import "../../../business/entities/bank_entity.dart";

/// Model that transforms the Bank data from the API to the application
/// entity
class BankModel extends BankEntity {
  /// Model that transforms the Bank data from the API to the application
  /// entity
  const BankModel({
    required super.id,
    required super.name,
    required super.color,
    super.description,
    super.logo,
    super.url,
  });

  /// Factory method to create an account model instance from a Drift [AccountItem]
  factory BankModel.fromDrift({
    required BankItem item,
  }) =>
      BankModel(
        id: item.id,
        name: item.name,
        color: ColorExtension.fromHex(item.color),
        description: item.description,
        logo: item.logo,
        url: item.url,
      );
}
