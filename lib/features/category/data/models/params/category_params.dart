import '../../../../../core/constants/classes/params.dart';

/// Parameters used to make the Category request.
class CategoryParams extends Params {
  /// Parameters used to make the Category request.
  CategoryParams();
  
  

  @override
  Map<String, dynamic> headers() => {
        "Authorization": "Bearer $accessToken",
      };

  @override
  Map<String, dynamic>? queries() => null;

  @override
  Map<String, dynamic> body() => {};
}