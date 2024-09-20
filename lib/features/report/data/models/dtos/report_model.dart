import "dart:convert";

import "../../../business/entities/report_entity.dart";

/// Model that transforms the Report data from the API to the
/// application entity
class ReportModel extends ReportEntity {
  /// Model that transforms the Report data from the API to the
  /// application entity
  const ReportModel();

  

  /// Factory method to create a Home model instance from a JSON
  factory ReportModel.fromJson({required String json}) => ReportModel.fromMap(map: jsonDecode(json));

  /// Factory method to create a Report model instance from a map
  factory ReportModel.fromMap({required Map<String, dynamic> map}) =>
     const ReportModel();

  /// Factory method to create a Report model instance from an 
  /// entity
  factory ReportModel.fromEntity({required ReportEntity entity}) => const ReportModel();

  /// Converts the Report model instance to a map
  Map<String, dynamic> toMap() => {};

  /// Converts the Home model instance to a JSON
  String toJson() => jsonEncode(toMap());
  
  /// Converts the Report model instance to an entity
  ReportEntity toEntity() => const ReportEntity();
}
