import "package:drift/drift.dart";

import "../../../../../core/constants/classes/mock_data.dart";
import "../../../business/entities/enums/enums.dart";
import "../../../business/entities/logo_entity.dart";

/// Model that transforms the Logo data from the API to the
/// application entity
class LogoModel extends LogoEntity {
  /// Model that transforms the Logo data from the API to the
  /// application entity
  const LogoModel({
    required super.name,
    required super.domain,
    required super.category,
    required super.style,
    super.path,
  });

  /// Constructor that creates a [LogoModel] from a map
  factory LogoModel.fromMap(Map<String, dynamic> map) => LogoModel(
        name: map["name"] as String,
        domain: map["domain"] as String,
        category: map["category"] as LogoCategoryEnum,
        style: map["style"] as LogoStyleEnum,
        path: map["path"] as String?,
      );

  /// Create a [LogoTableCompanion] from this model
  LogoTableCompanion toCompanion() => LogoTableCompanion(
        name: Value(name),
        domain: Value(domain),
        category: Value(category),
        style: Value(style),
        path: Value(path),
      );
}
