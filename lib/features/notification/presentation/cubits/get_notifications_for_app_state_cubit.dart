import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';
import '../../../shared/shared.dart';
import '../../business/business.dart';

/// Cubit in charge for handling the loading state for the list of notifications
class GetNotificationsForAppStateCubit
    extends GetInfoCubit<List<NotificationEntity>> {
  /// Cubit in charge for handling the loading state for the list of notifications

  GetNotificationsForAppStateCubit({
    required this.appId,
  });

  /// Id of the app to retrieve the notifications
  final int appId;

  @override
  Future<Either<Failure, List<NotificationEntity>>> callUseCase() =>
      GetNotificationsByAppIdUseCase(
        notificationRepository: GetIt.I.get<NotificationRepository>(),
      ).call(
        params: ByIdParams(
          id: appId,
        ),
      );
}
