import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../shared/presentation/widgets/whatsapp_appbar.dart';
import '../../business/business.dart';

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
            _AppNotificationList(app),
          ],
        ),
      );
}

class _AppNotificationList extends StatelessWidget {
  const _AppNotificationList(this.app);

  final AppNotificationEntity app;

  @override
  Widget build(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            color: index.isOdd ? Colors.white : Colors.black12,
            height: 100,
            child: Center(
              child: Text(
                '$index',
                textScaler: const TextScaler.linear(
                  5,
                ),
              ),
            ),
          ),
          childCount: 20,
        ),
      );
}
