import "../../../../../core/constants/classes/params.dart";

/// Parameters used to make the Account request.
class AccountParams extends Params {
  /// Parameters used to make the Account request.
  AccountParams();

  @override
  Map<String, dynamic> headers() => {
        "Authorization": "Bearer $accessToken",
      };

  @override
  Map<String, dynamic>? queries() => null;

  @override
  Map<String, dynamic> body() => {};
}
