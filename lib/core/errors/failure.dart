import "app_exception.dart";

/// The abstract class for the failures in the application
abstract class Failure {
  /// The abstract class for the failures in the application
  Failure({
    required this.message,
    required this.title,
    required this.level,
  });

  /// The message of the error
  final String message;

  /// The title of the error
  final String title;

  /// The level of the error
  final FailureLevel level;
}

/// The levels of the failures
enum FailureLevel {
  /// Crtical error
  error,

  /// Warning error
  warning,

  /// Information error
  info,
}

/// Failure used for the application side
class AppFailure extends Failure {
  /// Failure used for the application side
  AppFailure({
    required super.message,
    required super.title,
    super.level = FailureLevel.error,
  });

  /// Create an [AppFailure]
  ///
  /// [message] is the message of the error
  ///
  /// This is used when the error is unexpected
  factory AppFailure.unexpected(String message) => AppFailure(
        title: "Ocurrió un error en la aplicación",
        message: message,
      );

  /// Create an [AppFailure]
  ///
  /// [errorMessage] is the message of the error
  ///
  /// This is used when the error is related to the environment
  factory AppFailure.environment({
    required String errorMessage,
  }) =>
      AppFailure(
        title: "Ocurrió un error en la aplicación",
        message: errorMessage,
      );

  /// Create an [AppFailure]
  ///
  /// [exception] is the exception that was thrown
  ///
  /// This is used when the error is related to cache operations
  factory AppFailure.cacheException(DriftException exception) => AppFailure(
        title: exception.title,
        message: exception.message,
        level: FailureLevel.error,
      );
}
