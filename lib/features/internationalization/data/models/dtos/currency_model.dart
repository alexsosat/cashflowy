import '../../../business/entities/currency_entity.dart';

/// Model that transforms the Currency data from the API to the application
/// entity
class CurrencyModel extends CurrencyEntity {
  /// Model that transforms the Currency data from the API to the application
  /// entity
  const CurrencyModel({
    required super.code,
    required super.name,
  });

  /// Creates a Currency model from a map
  factory CurrencyModel.fromMapEntry({
    required MapEntry map,
  }) =>
      CurrencyModel(
        code: map.key,
        name: map.value,
      );

  /// Converts the Currency model to a map
  Map<String, dynamic> toMapEntry() => {
        code: name,
      };
}
