import 'dart:typed_data';

import '../../../../../core/constants/classes/params.dart';

/// Parameters to save a notification
class SaveNotificationParams extends Params {
  /// Parameters to save a notification
  SaveNotificationParams({
    required this.appPackageName,
    this.appIcon,
    this.appId,
    this.title,
    this.description,
    this.date,
    this.infoText,
    this.bigText,
    this.subText,
    this.hasRegexMatch = false,
  });

  /// Package name of the app that sent the notification
  final String appPackageName;

  /// App icon
  final Uint8List? appIcon;

  /// Notification title
  final String? title;

  /// Notification description
  final String? description;

  /// Notification date
  final DateTime? date;

  /// True if the notification matches the app regex
  bool hasRegexMatch;

  /// App id
  int? appId;

  /// Notification info text
  final String? infoText;

  /// Notification big text
  final String? bigText;

  /// Notification sub text
  final String? subText;
}
