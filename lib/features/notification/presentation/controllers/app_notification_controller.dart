import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/localization/l10n.dart';
import '../../../shared/presentation/widgets/overlays/overlays.dart';
import '../../notification.dart';

/// Controller for the AppNotification feature
class AppNotificationController {
  /// Change the value of notifications save of an app
  static Future changeNotificationsValueSaveNotifications(
    BuildContext context,
    ChangeAppNotificationSaveNotificationParams params,
  ) async {
    showLoadingOverlay(
      context: context,
      message: params.saveNotifications
          ? AppLocalizations.current.enablingAppNotificationsLoadingMessage
          : AppLocalizations.current.disablingAppNotificationsLoadingMessage,
    );

    final response = await ChangeAppNotificationSaveNotificationsUseCase(
      appNotificationRepository: GetIt.I<AppNotificationRepository>(),
      notificationRepository: GetIt.I<NotificationRepository>(),
    ).call(
      params: params,
    );

    if (!context.mounted) return;

    hideLoadingOverlay(context: context);

    await response.fold(
      (failure) => showFailureDialog(
        context: context,
        failure: failure,
      ),
      (deletedNotifications) => showSuccessDialog(
        title: AppLocalizations.current.successOperation,
        context: context,
        message: params.saveNotifications
            ? AppLocalizations.current.appNotificationsEnabledMessage
            : AppLocalizations.current.deletedNotificationsCountMessage(
                deletedNotifications,
              ),
      ),
    );
  }
}
