import "package:equatable/equatable.dart";

/// Entity that contains the data of the Notification.
class NotificationEntity extends Equatable {
  /// Entity that contains the data of the Notification.
  const NotificationEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.appId,
    this.infoText,
    this.bigText,
    this.subText,
  });

  /// Notification Id
  final int id;

  /// Notification title
  final String title;

  /// Notification body description
  final String description;

  /// Notification date
  final DateTime date;

  /// Id of the app that the notification belongs to
  final int appId;

  /// Notification info text
  final String? infoText;

  /// Notification big text
  final String? bigText;

  /// Notification sub text
  final String? subText;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        date,
        appId,
        infoText,
        bigText,
        subText,
      ];

  @override
  bool get stringify => true;
}
