import "../../../../core/assets/assets.gen.dart";
import "../../../../core/errors/connection/http_call_exception.dart";
import "../../../../core/errors/failure.dart";

/// Returns the path of the animation to show for the given [Failure].
String getErrorAnimation(Failure failure) {
  if (failure is AppFailure) {
    return Assets.animations.errors.appError;
  } else if (failure is HttpCallFailure) {
    return _getImagePath(failure.type);
  } else {
    return Assets.animations.errors.unexpected;
  }
}

String _getImagePath(HttpExceptions type) {
  switch (type) {
    case HttpExceptions.connectionError:
    case HttpExceptions.clientOffline:
      return Assets.animations.errors.noInternet;
    case HttpExceptions.serverDown:
    case HttpExceptions.serverError:
      return Assets.animations.errors.serverError;
    case HttpExceptions.unauthorized:
    case HttpExceptions.expiredToken:
      return Assets.animations.errors.unauthorized;
    case HttpExceptions.clientError:
    case HttpExceptions.badRequest:
      return Assets.animations.errors.badRequest;
    case HttpExceptions.cancelRequest:
      return Assets.animations.errors.canceled;
    case HttpExceptions.badCertificate:
      return Assets.animations.errors.badCertificate;
    case HttpExceptions.other:
      return Assets.animations.errors.unexpected;
  }
}
