part of '../libraries/app_notification_list_library.dart';

class _AppNotificationTile extends StatefulWidget {
  const _AppNotificationTile(this.app);

  final AppNotificationEntity app;

  @override
  State<_AppNotificationTile> createState() => __AppNotificationTileState();
}

class __AppNotificationTileState extends State<_AppNotificationTile> {
  bool _saveNotifications = false;

  @override
  void initState() {
    _saveNotifications = widget.app.saveNotifications;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {},
        title: Text(widget.app.packageName),
        leading: widget.app.icon != null
            ? CircleAvatar(
                backgroundImage: MemoryImage(widget.app.icon!),
              )
            : Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
        trailing: Switch(
          value: _saveNotifications,
          onChanged: _toggleSaveNotifications,
        ),
      );

  void _toggleSaveNotifications(bool value) async {
    final action = value
        ? AppLocalizations.current.enable
        : AppLocalizations.current.disable;

    final packageName = widget.app.packageName;

    final dialogResponse = await showConfirmationDialog(
      context: context,
      title: AppLocalizations.current.appNotificationEnableQuestion(
        action,
        packageName,
      ),
      message: value
          ? AppLocalizations.current.enableAppNotificationsWarningMessage
          : AppLocalizations.current.deleteAppNotificationsWarningMessage(
              packageName,
            ),
    );

    // TODO: Execute use case to enable or disable notifications

    setState(() {
      _saveNotifications = value;
    });
  }
}
