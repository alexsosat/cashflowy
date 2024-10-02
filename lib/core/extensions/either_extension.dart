import 'package:fpdart/fpdart.dart';

import '../errors/app_exception.dart';
import '../errors/failure.dart';
import '../localization/l10n.dart';

/// Extension for the [Either] class
extension EitherExtension on Either {
  /// Returns the value of the [Either] if it is [Right] or throws an exception if it is [Left].
  Failure getFailure<T>() {
    if (this is Right) {
      throw AppException(
        message: AppLocalizations.current.cannotGetFailureFromRight,
      );
    } else {
      try {
        return (this as Left).value as Failure;
      } catch (e) {
        throw AppException(
          message: AppLocalizations.current.cannotGetFailureFromLeft,
        );
      }
    }
  }

  /// Returns the value of the [Either]
  /// if it is [Left] or throws an exception if it is [Right].
  T getValue<T>() {
    if (this is Left) {
      throw AppException(
        message: AppLocalizations.current.cannotGetValueFromLeft,
      );
    } else {
      try {
        return (this as Right).value as T;
      } catch (e) {
        throw AppException(
          message: AppLocalizations.current.cannotGetValueFromRight,
        );
      }
    }
  }
}
