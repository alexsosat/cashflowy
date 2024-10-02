import "package:drift/drift.dart";

import "../../../../../core/errors/app_exception.dart";
import "../../../../../core/localization/l10n.dart";
import "../../../../../core/services/database/app_database.dart";

import "../../../../shared/data/models/params/params.dart";
import "../../models/dtos/dtos.dart";
import "../../models/params/params.dart";

/// Local data source for the Notification collection
abstract class AppNotificationLocalDataSource {
  /// Gets all saved apps that have sent notifications to the phone
  Future<List<AppNotificationModel>> getApps();

  /// Get an app by its package name
  ///
  /// Returns null if the app is not found
  Future<AppNotificationModel?> getAppByPackageName({
    required ByPackageParams params,
  });

  /// Get the regex stored in the local database for an specific app package
  Future<List<AppRegexModel>> getAppRegex({
    required ByIdParams params,
  });

  /// Save an app that has sent notifications to the phone
  ///
  /// Returns the id of the saved app
  Future<int> saveApp({
    required AppNotificationParams params,
  });

  /// Changes the value of the [saveNotification] field in the
  /// app notification table
  Future<bool> changeSaveNotification({
    required ChangeAppNotificationSaveNotificationParams params,
  });
}

/// Local data source for the Notification collection
class AppNotificationLocalDataSourceImpl
    implements AppNotificationLocalDataSource {
  /// Local data source for the Notification collection
  AppNotificationLocalDataSourceImpl({required this.localSource});

  /// Shared preferences instance
  final AppDatabase localSource;

  @override
  Future<List<AppNotificationModel>> getApps() async {
    try {
      final apps =
          await localSource.select(localSource.appNotificationTable).get();

      return apps
          .map((e) => AppNotificationModel.fromDatabase(companion: e))
          .toList();
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.getAppsExceptionMessage,
        message: e.toString(),
      );
    }
  }

  @override
  Future<AppNotificationModel?> getAppByPackageName({
    required ByPackageParams params,
  }) async {
    try {
      final app = await (localSource.select(localSource.appNotificationTable)
            ..where(
              (app) => app.packageName.equals(params.package),
            ))
          .getSingleOrNull();

      if (app == null) {
        return null;
      }

      return AppNotificationModel.fromDatabase(companion: app);
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.getAppExceptionMessage,
        message: e.toString(),
      );
    }
  }

  @override
  Future<List<AppRegexModel>> getAppRegex({
    required ByIdParams params,
  }) async {
    try {
      final regexList = await (localSource.select(localSource.appRegexTable)
            ..where(
              (regex) => regex.appId.equals(params.id),
            ))
          .get();

      return regexList
          .map(
            (regex) => AppRegexModel.fromDatabase(companion: regex),
          )
          .toList();
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.getAppRegexExceptionMessage,
        message: e.toString(),
      );
    }
  }

  @override
  Future<int> saveApp({
    required AppNotificationParams params,
  }) async {
    try {
      final id =
          await localSource.into(localSource.appNotificationTable).insert(
                AppNotificationTableCompanion(
                  packageName: Value(params.packageName),
                  icon: Value(params.icon),
                ),
              );

      return id;
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.saveAppExceptionMessage,
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> changeSaveNotification({
    required ChangeAppNotificationSaveNotificationParams params,
  }) async {
    try {
      final affectedTables =
          await (localSource.update(localSource.appNotificationTable)
                ..where(
                  (app) => app.id.equals(params.appId),
                ))
              .write(
        AppNotificationTableCompanion(
          saveNotifications: Value(params.saveNotifications),
        ),
      );

      return affectedTables > 0;
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.changeSaveNotificationExceptionMessage,
        message: e.toString(),
      );
    }
  }
}
