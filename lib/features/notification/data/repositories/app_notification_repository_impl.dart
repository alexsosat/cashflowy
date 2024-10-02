import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/error_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../../shared/data/models/params/by_id_params.dart';
import '../../business/entities/app_regex_entity.dart';
import '../../business/repositories/app_notification_repository.dart';
import '../data_sources/local/app_notification_local_datasource.dart';
import '../models/dtos/dtos.dart';
import '../models/params/params.dart';

/// Data operations for the App Notification collection
class AppNotificationRepositoryImpl implements AppNotificationRepository {
  /// Data operations for the App Notification collection
  const AppNotificationRepositoryImpl({
    required this.localDataSource,
  });

  /// Local data source for the App Notification collection
  final AppNotificationLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<AppNotificationModel>>> getApps() =>
      ErrorHandler.handleCacheCall(
        localDataSource.getApps,
      );

  @override
  Future<Either<Failure, AppNotificationModel?>> getAppByPackageName({
    required ByPackageParams params,
  }) =>
      ErrorHandler.handleCacheCall(
        () => localDataSource.getAppByPackageName(params: params),
      );

  @override
  Future<Either<Failure, int>> saveApp({
    required AppNotificationParams params,
  }) =>
      ErrorHandler.handleCacheCall(
        () => localDataSource.saveApp(params: params),
      );

  @override
  Future<Either<Failure, List<AppRegexEntity>>> getAppRegex({
    required ByIdParams params,
  }) =>
      ErrorHandler.handleCacheCall(
        () => localDataSource.getAppRegex(params: params),
      );

  @override
  Future<Either<Failure, bool>> changeSaveNotification({
    required ChangeAppNotificationSaveNotificationParams params,
  }) =>
      ErrorHandler.handleCacheCall(
        () => localDataSource.changeSaveNotification(params: params),
      );
}
