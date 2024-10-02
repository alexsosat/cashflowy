import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/extensions/either_extension.dart';
import '../../../shared/data/models/params/by_id_params.dart';
import '../../notification.dart';

/// Use case for saving a notification
///
/// Saves the app if it doesn't exist
///
/// Returns null if the notification is not saved
class SaveNotificationUseCase implements UseCase<int?, SaveNotificationParams> {
  /// Use case for saving a notification
  SaveNotificationUseCase({
    required this.notificationRepository,
    required this.appNotificationRepository,
  });

  /// Notification repository
  final NotificationRepository notificationRepository;

  /// App notification repository
  final AppNotificationRepository appNotificationRepository;

  @override
  Future<Either<Failure, int?>> call({
    required SaveNotificationParams params,
  }) async {
    // Get the app by its package name
    final appsResponse = await appNotificationRepository.getAppByPackageName(
      params: ByPackageParams(package: params.appPackageName),
    );

    if (appsResponse.isLeft()) {
      return Left(
        appsResponse.getFailure(),
      );
    }

    AppNotificationEntity? app =
        appsResponse.getValue<AppNotificationEntity?>();

    // Save the app if it doesn't exist
    if (app == null) {
      final saveAppResponse = await appNotificationRepository.saveApp(
        params: AppNotificationParams(
          packageName: params.appPackageName,
          icon: params.appIcon,
        ),
      );

      if (saveAppResponse.isLeft()) {
        return Left(
          saveAppResponse.getFailure(),
        );
      }

      app = saveAppResponse.getValue<AppNotificationEntity>();
    }

    // if the app doesn't save notifications, return null
    if (!app.saveNotifications) {
      return const Right(
        null,
      );
    }

    params.appId = app.id;

    // Check if the description has a regex match
    final regexResponse = await appNotificationRepository.getAppRegex(
      params: ByIdParams(id: app.id),
    );

    if (regexResponse.isLeft()) {
      return Left(
        regexResponse.getFailure(),
      );
    }

    final regexList = regexResponse.getValue<List<AppRegexEntity>>();

    for (final value in regexList) {
      final regex = RegExp(value.regex);

      if (regex.hasMatch(params.description ?? "")) {
        params.hasRegexMatch = true;
      }
    }

    return notificationRepository.saveNotification(
      params: params,
    );
  }
}
