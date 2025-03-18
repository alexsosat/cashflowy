/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// Directory path: assets/animations/dialog
  $AssetsAnimationsDialogGen get dialog => const $AssetsAnimationsDialogGen();

  /// Directory path: assets/animations/errors
  $AssetsAnimationsErrorsGen get errors => const $AssetsAnimationsErrorsGen();
}

class $AssetsAnimationsDialogGen {
  const $AssetsAnimationsDialogGen();

  /// File path: assets/animations/dialog/error.json
  String get error => 'assets/animations/dialog/error.json';

  /// File path: assets/animations/dialog/info.json
  String get info => 'assets/animations/dialog/info.json';

  /// File path: assets/animations/dialog/success.json
  String get success => 'assets/animations/dialog/success.json';

  /// File path: assets/animations/dialog/warning.json
  String get warning => 'assets/animations/dialog/warning.json';

  /// List of all assets
  List<String> get values => [error, info, success, warning];
}

class $AssetsAnimationsErrorsGen {
  const $AssetsAnimationsErrorsGen();

  /// File path: assets/animations/errors/app_error.json
  String get appError => 'assets/animations/errors/app_error.json';

  /// File path: assets/animations/errors/bad_certificate.json
  String get badCertificate => 'assets/animations/errors/bad_certificate.json';

  /// File path: assets/animations/errors/bad_request.json
  String get badRequest => 'assets/animations/errors/bad_request.json';

  /// File path: assets/animations/errors/canceled.json
  String get canceled => 'assets/animations/errors/canceled.json';

  /// File path: assets/animations/errors/no_content.json
  String get noContent => 'assets/animations/errors/no_content.json';

  /// File path: assets/animations/errors/no_internet.json
  String get noInternet => 'assets/animations/errors/no_internet.json';

  /// File path: assets/animations/errors/server_error.json
  String get serverError => 'assets/animations/errors/server_error.json';

  /// File path: assets/animations/errors/unauthorized.json
  String get unauthorized => 'assets/animations/errors/unauthorized.json';

  /// File path: assets/animations/errors/unexpected.json
  String get unexpected => 'assets/animations/errors/unexpected.json';

  /// List of all assets
  List<String> get values => [
    appError,
    badCertificate,
    badRequest,
    canceled,
    noContent,
    noInternet,
    serverError,
    unauthorized,
    unexpected,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
}
