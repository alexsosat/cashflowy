import '../../../../../core/constants/classes/params.dart';

/// Parameters used to search for an app by its package name.
class ByPackageParams extends Params {
  /// Parameters used to search for an app by its package name.
  const ByPackageParams({required this.package});

  /// The package name of the app.
  final String package;
}
