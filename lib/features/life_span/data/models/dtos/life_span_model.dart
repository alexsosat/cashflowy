import "dart:convert";

import "../../../business/entities/life_span_entity.dart";

/// Model that transforms the LifeSpan data from the API to the
/// application entity
class LifeSpanModel extends LifeSpanEntity {
  /// Model that transforms the LifeSpan data from the API to the
  /// application entity
  const LifeSpanModel();

  

  /// Factory method to create a Home model instance from a JSON
  factory LifeSpanModel.fromJson({required String json}) => LifeSpanModel.fromMap(map: jsonDecode(json));

  /// Factory method to create a LifeSpan model instance from a map
  factory LifeSpanModel.fromMap({required Map<String, dynamic> map}) =>
     const LifeSpanModel();

  /// Factory method to create a LifeSpan model instance from an 
  /// entity
  factory LifeSpanModel.fromEntity({required LifeSpanEntity entity}) => const LifeSpanModel();

  /// Converts the LifeSpan model instance to a map
  Map<String, dynamic> toMap() => {};

  /// Converts the Home model instance to a JSON
  String toJson() => jsonEncode(toMap());
  
  /// Converts the LifeSpan model instance to an entity
  LifeSpanEntity toEntity() => const LifeSpanEntity();
}
