import "../../../../../core/constants/classes/mock_data.dart";
import "../../../business/entities/logo_entity.dart";

/// Model that transforms the Logo data from the API to the
/// application entity
class LogoModel extends LogoEntity {
  /// Model that transforms the Logo data from the API to the
  /// application entity
  const LogoModel({
    required super.id,
    required super.name,
    required super.domain,
    required super.category,
    required super.style,
    super.path,
  });

  /// Constructor that creates a [LogoModel] from a [LogoTableData]
  factory LogoModel.fromTable(LogoTableData data) => LogoModel(
        id: data.id,
        name: data.name,
        domain: data.domain,
        category: data.category,
        style: data.style,
        path: data.path,
      );
}
