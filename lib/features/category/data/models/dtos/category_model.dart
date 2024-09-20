import "dart:convert";

import "../../../business/entities/category_entity.dart";

/// Model that transforms the Category data from the API to the
/// application entity
class CategoryModel extends CategoryEntity {
  /// Model that transforms the Category data from the API to the
  /// application entity
  const CategoryModel();

  

  /// Factory method to create a Home model instance from a JSON
  factory CategoryModel.fromJson({required String json}) => CategoryModel.fromMap(map: jsonDecode(json));

  /// Factory method to create a Category model instance from a map
  factory CategoryModel.fromMap({required Map<String, dynamic> map}) =>
     const CategoryModel();

  /// Factory method to create a Category model instance from an 
  /// entity
  factory CategoryModel.fromEntity({required CategoryEntity entity}) => const CategoryModel();

  /// Converts the Category model instance to a map
  Map<String, dynamic> toMap() => {};

  /// Converts the Home model instance to a JSON
  String toJson() => jsonEncode(toMap());
  
  /// Converts the Category model instance to an entity
  CategoryEntity toEntity() => const CategoryEntity();
}
