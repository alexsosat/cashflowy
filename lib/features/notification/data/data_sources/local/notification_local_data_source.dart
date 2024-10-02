import "package:drift/drift.dart";

import "../../../../../core/errors/app_exception.dart";
import "../../../../../core/localization/l10n.dart";
import "../../../../../core/services/database/app_database.dart";
import "../../../../shared/shared.dart";
import "../../../notification.dart";

/// Local data source for the Notification collection
abstract class NotificationLocalDataSource {
  /// Gets the notifications saved for an app id
  Future<List<NotificationModel>> getNotificationsByAppId({
    required ByIdParams params,
  });

  /// Save a notification to the local database
  Future<int> saveNotification({
    required SaveNotificationParams params,
  });

  /// Deletes all notifications from an specific app id
  ///
  /// Returns the amount of deleted notifications
  Future<int> deleteNotificationsByAppId({
    required ByIdParams params,
  });
}

/// Local data source for the Notification collection
class NotificationLocalDataSourceImpl implements NotificationLocalDataSource {
  /// Local data source for the Notification collection
  NotificationLocalDataSourceImpl({
    required this.localSource,
  });

  /// Shared preferences instance
  final AppDatabase localSource;

  @override
  Future<List<NotificationModel>> getNotificationsByAppId({
    required ByIdParams params,
  }) async {
    try {
      final notifications =
          await (localSource.select(localSource.notificationTable)
                ..where(
                  (t) => t.appId.equals(params.id),
                ))
              .get();

      return notifications
          .map(
            (e) => NotificationModel.fromDatabase(companion: e),
          )
          .toList();
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.getNotificationsExceptionMessage,
        message: e.toString(),
      );
    }
  }

  @override
  Future<int> saveNotification({
    required SaveNotificationParams params,
  }) async {
    try {
      final notificationId =
          await localSource.into(localSource.notificationTable).insert(
                NotificationTableCompanion(
                  title: Value(params.title ?? ""),
                  description: Value(params.description ?? ""),
                  time: params.date != null
                      ? Value(params.date!)
                      : const Value.absent(),
                  appId: Value(params.appId!),
                  infoText: Value(params.infoText),
                  bigText: Value(params.bigText),
                  subText: Value(params.subText),
                ),
              );

      return notificationId;
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.saveNotificationExceptionMessage,
        message: e.toString(),
      );
    }
  }

  @override
  Future<int> deleteNotificationsByAppId({
    required ByIdParams params,
  }) async {
    try {
      final affectedTables =
          await (localSource.delete(localSource.notificationTable)
                ..where(
                  (t) => t.appId.equals(params.id),
                ))
              .go();

      return affectedTables;
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.deleteNotificationsExceptionMessage,
        message: e.toString(),
      );
    }
  }
}
