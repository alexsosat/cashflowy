import '../../../../../core/constants/classes/params.dart';

/// Parameters to change the value of notifications save of an app
class ChangeAppNotificationSaveNotificationParams extends Params {
  /// Parameters to change the value of notifications save of an app
  ChangeAppNotificationSaveNotificationParams({
    required this.appId,
    required this.saveNotifications,
  });

  /// App id of the value to change
  final int appId;

  /// New value of the notifications save
  final bool saveNotifications;
}
