import '../../../../../core/constants/classes/params.dart';

/// Parameters used to make the LifeSpan request.
class LifeSpanParams extends Params {
  /// Parameters used to make the LifeSpan request.
  LifeSpanParams();
  
  

  @override
  Map<String, dynamic> headers() => {
        "Authorization": "Bearer $accessToken",
      };

  @override
  Map<String, dynamic>? queries() => null;

  @override
  Map<String, dynamic> body() => {};
}