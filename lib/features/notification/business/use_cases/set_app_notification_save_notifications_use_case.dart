import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/extensions/either_extension.dart';
import '../../../shared/data/models/params/params.dart';
import '../../data/models/params/params.dart';
import '../repositories/repositories.dart';

/// Use case for changing the value of notifications save of an app
class SetAppNotificationSaveNotificationsUseCase
    implements UseCase<int, ChangeAppNotificationSaveNotificationParams> {
  /// Use case for changing the value of notifications save of an app
  SetAppNotificationSaveNotificationsUseCase({
    required this.appNotificationRepository,
    required this.notificationRepository,
  });

  /// App notification repository
  final AppNotificationRepository appNotificationRepository;

  /// Notification repository
  final NotificationRepository notificationRepository;

  @override
  Future<Either<Failure, int>> call({
    required ChangeAppNotificationSaveNotificationParams params,
  }) async {
    int deletedNotifications = 0;
    if (!params.saveNotifications) {
      final callResponse =
          await notificationRepository.deleteNotificationsByAppId(
        params: ByIdParams(
          id: params.appId,
        ),
      );

      if (callResponse.isLeft()) {
        return Left(
          callResponse.getFailure(),
        );
      }

      deletedNotifications = callResponse.getValue<int>();
    }

    final response = await appNotificationRepository.changeSaveNotification(
      params: params,
    );

    if (response.isLeft()) {
      return Left(
        response.getFailure(),
      );
    }

    return Right(
      deletedNotifications,
    );
  }
}
