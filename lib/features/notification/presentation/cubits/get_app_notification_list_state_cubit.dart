import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/errors/failure.dart';

import '../../../shared/data/models/params/no_params.dart';
import '../../../shared/presentation/cubits/get_info_cubit.dart';
import '../../business/use_cases/get_notification_apps_use_case.dart';
import '../../notification.dart';

/// Cubit that manages the loading of the list of apps that has sent a
/// notification to this device
class GetAppNotificationListStateCubit
    extends GetInfoCubit<List<AppNotificationEntity>> {
  @override
  Future<Either<Failure, List<AppNotificationEntity>>> callUseCase() =>
      GetNotificationAppsUseCase(
        appNotificationRepository: GetIt.I.get(),
      ).call(
        params: const NoParams(),
      );
}
