import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/data/models/params/params.dart';
import '../../data/models/params/params.dart';
import '../entities/entities.dart';

/// Data operations for the AppNotification collection
abstract class AppNotificationRepository {
  /// Gets all saved apps that have sent notifications to the phone
  Future<Either<Failure, List<AppNotificationEntity>>> getApps();

  /// Get an app by its package name
  Future<Either<Failure, AppNotificationEntity?>> getAppByPackageName({
    required ByPackageParams params,
  });

  /// Get the regex stored in the local database for an specific app id
  Future<Either<Failure, List<AppRegexEntity>>> getAppRegex({
    required ByIdParams params,
  });

  /// Save an app that has sent notifications to the phone
  Future<Either<Failure, int>> saveApp({
    required AppNotificationParams params,
  });

  /// Changes the value of the [saveNotification] for an app id
  ///
  /// Turning on the value makes the app to save the notifications for the app
  Future<Either<Failure, bool>> changeSaveNotification({
    required ChangeAppNotificationSaveNotificationParams params,
  });
}
