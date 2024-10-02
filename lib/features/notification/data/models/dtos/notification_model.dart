import "../../../../../core/services/database/app_database.dart";
import "../../../business/entities/notification_entity.dart";

/// Model that transforms the Notification data from the API to the
/// application entity
class NotificationModel extends NotificationEntity {
  /// Model that transforms the Notification data from the API to the
  /// application entity
  const NotificationModel({
    required super.id,
    required super.title,
    required super.description,
    required super.date,
    required super.appId,
    super.infoText,
    super.bigText,
    super.subText,
  });

  /// Factory method to create a Home model instance from a JSON
  factory NotificationModel.fromDatabase({
    required NotificationTableData companion,
  }) =>
      NotificationModel(
        id: companion.id,
        title: companion.title,
        description: companion.description,
        date: companion.time,
        appId: companion.appId,
        bigText: companion.bigText,
        infoText: companion.infoText,
        subText: companion.subText,
      );
}
