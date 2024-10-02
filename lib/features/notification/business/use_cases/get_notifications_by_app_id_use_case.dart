import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../shared/shared.dart';
import '../business.dart';

/// Use case for retrieving the notifications of an app
class GetNotificationsByAppIdUseCase
    implements UseCase<List<NotificationEntity>, ByIdParams> {
  /// Use case for retrieving the notifications of an app
  GetNotificationsByAppIdUseCase({
    required this.notificationRepository,
  });

  /// Notification repository
  final NotificationRepository notificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call({
    required ByIdParams params,
  }) async =>
      notificationRepository.getNotificationsByAppId(
        params: params,
      );
}
