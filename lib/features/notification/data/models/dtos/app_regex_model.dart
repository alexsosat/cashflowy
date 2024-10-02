import '../../../../../core/constants/classes/mock_data.dart';
import '../../../business/entities/app_regex_entity.dart';
import '../../../notification.dart';

/// Model that transforms the AppRegex data from the API to the application
/// entity
class AppRegexModel extends AppRegexEntity {
  /// Model that transforms the AppRegex data from the API to the application
  /// entity
  const AppRegexModel({
    required super.id,
    required super.isPurchase,
    required super.regex,
  });

  /// Factory method to create a Home model instance from a JSON
  factory AppRegexModel.fromDatabase({
    required AppRegexTableData companion,
  }) =>
      AppRegexModel(
        id: companion.id,
        isPurchase: companion.isPurchase,
        regex: companion.regex,
      );
}
