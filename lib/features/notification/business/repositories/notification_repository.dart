import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/data/models/params/params.dart';
import '../../notification.dart';

/// Data operations for the Notification collection
abstract class NotificationRepository {
  /// Get all notifications saved belonging to an app id
  Future<Either<Failure, List<NotificationEntity>>> getNotificationsByAppId({
    required ByIdParams params,
  });

  /// Save a notification to the local database
  ///
  /// Returns the id of the saved notification
  Future<Either<Failure, int>> saveNotification({
    required SaveNotificationParams params,
  });

  /// Deletes all notifications belonging to an app id
  Future<Either<Failure, int>> deleteNotificationsByAppId({
    required ByIdParams params,
  });
}
