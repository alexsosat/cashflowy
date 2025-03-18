import "../../../../../core/adapters/dio_adapter.dart";
import "../../models/params/params.dart";

/// Remote data source for the Logo collection
abstract class LogoRemoteDataSource {
  /// Downloads a logo image from source
  ///
  /// Returns the path where the image was saved
  Future<bool> downloadLogo({
    required DownloadLogoParams params,
  });
}

/// Remote data source for the Logo collection
class LogoRemoteDataSourceImpl implements LogoRemoteDataSource {
  /// Remote data source for the Logo collection
  LogoRemoteDataSourceImpl({
    required this.dio,
  });

  /// Dio adapter instance
  final DioAdapter dio;

  /// Domain where the logos are retrieved
  String get _logoProviderUrl => "https://cdn.brandfetch.io/";

  /// Key to access the logo provider
  String get _logoProviderKey => "1idBUEMQFe7cJJidmw1";

  @override
  Future<bool> downloadLogo({
    required DownloadLogoParams params,
  }) async {
    final response = await dio.download(
      "$_logoProviderUrl${params.domain}/${params.category}?c=$_logoProviderKey",
      params.directory,
    );

    return response.statusCode == 200;
  }
}
