import '../../../../../core/constants/classes/params.dart';

/// Parameters used to make the Transaction request.
class TransactionParams extends Params {
  /// Parameters used to make the Transaction request.
  TransactionParams();
  
  

  @override
  Map<String, dynamic> headers() => {
        "Authorization": "Bearer $accessToken",
      };

  @override
  Map<String, dynamic>? queries() => null;

  @override
  Map<String, dynamic> body() => {};
}