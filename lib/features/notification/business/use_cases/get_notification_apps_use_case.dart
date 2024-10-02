import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../shared/data/models/params/no_params.dart';
import '../../notification.dart';

/// Use case for retrieving the list of apps that has sent a notification to this device
class GetNotificationAppsUseCase
    implements UseCase<List<AppNotificationEntity>, NoParams> {
  /// Use case for retrieving the list of apps that has sent a notification to this device
  GetNotificationAppsUseCase({
    required this.appNotificationRepository,
  });

  /// App Notification repository
  final AppNotificationRepository appNotificationRepository;

  @override
  Future<Either<Failure, List<AppNotificationEntity>>> call({
    required NoParams params,
  }) async =>
      appNotificationRepository.getApps();
}
