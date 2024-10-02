import "dart:typed_data";

import "package:equatable/equatable.dart";

/// Entity that contains the AppNotification values.
///
/// This entity is the app that sends notifications to the user.
class AppNotificationEntity extends Equatable {
  /// Entity that contains the AppNotification values.
  const AppNotificationEntity({
    required this.id,
    required this.packageName,
    required this.saveNotifications,
    this.name,
    this.icon,
  });

  /// app id
  final int id;

  /// package name of the app
  final String packageName;

  /// app name
  final String? name;

  /// app icon
  final Uint8List? icon;

  /// True if the app must save the notifications of this app
  final bool saveNotifications;

  @override
  List<Object?> get props => [
        id,
        packageName,
        name,
        icon,
        saveNotifications,
      ];

  @override
  bool get stringify => true;
}
