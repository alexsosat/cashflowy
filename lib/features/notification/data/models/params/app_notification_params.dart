import "dart:typed_data";

import "../../../../../core/constants/classes/params.dart";

/// Parameters to save an app that has sent notifications to the phone
class AppNotificationParams extends Params {
  /// Parameters to save an app that has sent notifications to the phone
  const AppNotificationParams({
    required this.packageName,
    this.icon,
  });

  /// Package name of the app
  final String packageName;

  /// Icon of the app
  final Uint8List? icon;
}
