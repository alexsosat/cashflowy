import "../../../../../core/services/database/app_database.dart";
import "../../../business/entities/app_notification_entity.dart";

/// Model that transforms the AppNotification data from the API to the application
/// entity
class AppNotificationModel extends AppNotificationEntity {
  /// Model that transforms the AppNotification data from the API to the application
  /// entity
  const AppNotificationModel({
    required super.id,
    required super.packageName,
    required super.saveNotifications,
    super.name,
    super.icon,
  });

  /// Factory method to create a AppNotification model instance from a Drift
  /// database
  factory AppNotificationModel.fromDatabase({
    required AppNotificationTableData companion,
  }) =>
      AppNotificationModel(
        id: companion.id,
        packageName: companion.packageName,
        saveNotifications: companion.saveNotifications,
        icon: companion.icon,
      );
}
