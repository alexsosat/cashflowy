import '../../../../../core/constants/classes/params.dart';

/// Parameters used to make the Report request.
class ReportParams extends Params {
  /// Parameters used to make the Report request.
  ReportParams();
  
  

  @override
  Map<String, dynamic> headers() => {
        "Authorization": "Bearer $accessToken",
      };

  @override
  Map<String, dynamic>? queries() => null;

  @override
  Map<String, dynamic> body() => {};
}