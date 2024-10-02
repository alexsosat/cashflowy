part of '../libraries/app_notification_list_library.dart';

/// Page for displaying the list of apps that has sent a
/// notification to this device
///
/// Here the user can set the apps to save the notifications
@RoutePage()
class AppNotificationListPage extends StatelessWidget {
  /// Page for displaying the list of apps that has sent a
  /// notification to this device
  const AppNotificationListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.current.appList.toTitleCase(),
          ),
        ),
        body: BlocProvider(
          create: (_) => GetAppNotificationListStateCubit(),
          child: const _AppNotificationListPageContent(),
        ),
      );
}

class _AppNotificationListPageContent extends StatelessWidget {
  const _AppNotificationListPageContent();

  @override
  Widget build(BuildContext context) => CubitStateMixinBuilder<
          GetAppNotificationListStateCubit, List<AppNotificationEntity>>(
        onSuccess: (apps) => ListView.builder(
          padding: kPagePaddingNoHorizontal,
          itemCount: apps.length,
          itemBuilder: (context, index) => _AppNotificationTile(apps[index]),
        ),
        onEmpty: Center(
          child: Text(AppLocalizations.current.noAppsFound),
        ),
        onFailure: (failure) => Center(
          child: Text(failure.message),
        ),
      );
}
