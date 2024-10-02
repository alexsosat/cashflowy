import "package:fpdart/fpdart.dart";

import "../../../../core/errors/error_handler.dart";
import "../../../../core/errors/failure.dart";
import "../../../shared/data/models/params/by_id_params.dart";
import "../../notification.dart";

/// Data operations for the Notification collection
class NotificationRepositoryImpl implements NotificationRepository {
  /// Data operations for the Notification collection
  NotificationRepositoryImpl({
    required this.localDataSource,
  });

  /// Local data source for the Notification collection
  final NotificationLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotificationsByAppId({
    required ByIdParams params,
  }) =>
      ErrorHandler.handleCacheCall(
        () => localDataSource.getNotificationsByAppId(
          params: params,
        ),
      );

  @override
  Future<Either<Failure, int>> saveNotification({
    required SaveNotificationParams params,
  }) =>
      ErrorHandler.handleCacheCall(
        () async {
          final notificationId = await localDataSource.saveNotification(
            params: params,
          );

          return notificationId;
        },
      );

  @override
  Future<Either<Failure, int>> deleteNotificationsByAppId({
    required ByIdParams params,
  }) =>
      ErrorHandler.handleCacheCall(
        () async {
          final deletedNotifications =
              await localDataSource.deleteNotificationsByAppId(
            params: params,
          );

          return deletedNotifications;
        },
      );
}
