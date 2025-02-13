import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/widgets/cubit_state_mixin_builder.dart';
import '../../../shared/presentation/widgets/whatsapp_appbar.dart';
import '../../business/business.dart';
import '../cubits/get_notifications_for_app_state_cubit.dart';

/// Page that displays the notifications saved by an app
@RoutePage()
class AppNotificationItemPage extends StatelessWidget {
  /// Page that displays the notifications saved by an app
  const AppNotificationItemPage({
    required this.app,
    super.key,
  });

  /// App that has sent notifications
  final AppNotificationEntity app;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: WhatsappAppbar(
                screenWidth: MediaQuery.of(context).size.width,
                title: app.packageName,
                profilePicture: app.icon != null
                    ? CircleAvatar(
                        backgroundImage: MemoryImage(app.icon!),
                      )
                    : Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                      ),
              ),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: _AppActions(),
            ),
            BlocProvider(
              create: (context) => GetNotificationsForAppStateCubit(
                appId: app.id,
              ),
              child: const _AppNotificationList(),
            ),
          ],
        ),
      );
}

class _AppNotificationList extends StatelessWidget {
  const _AppNotificationList();

  @override
  Widget build(BuildContext context) => CubitStateMixinBuilder<
          GetNotificationsForAppStateCubit, List<NotificationEntity>>(
        onSuccess: (notifications) => SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: notifications.length,
            (context, index) => ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(notifications[index].title),
              subtitle: Text(notifications[index].description),
            ),
          ),
        ),
        onLoading: const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onEmpty: const SliverToBoxAdapter(
          child: Center(
            child: Text("No notifications found"),
          ),
        ),
        onFailure: (failure) => SliverToBoxAdapter(
          child: Center(
            child: Text(failure.title),
          ),
        ),
      );
}

class _AppActions extends StatelessWidget {
  const _AppActions();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              fixedSize: const Size(105, 105),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.abc),
                  Text(
                    "Asignar Regex",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
