import "package:fpdart/fpdart.dart";

import "../../../../core/errors/error_handler.dart";
import "../../../../core/errors/failure.dart";
import "../../../../core/services/connection/network_info.dart";
import "../../internationalization.dart";

/// Data operations for the Internationalization collection
class InternationalizationRepositoryImpl
    implements InternationalizationRepository {
  /// Data operations for the Internationalization collection
  InternationalizationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// Remote Data operations for the Internationalization collection
  final InternationalizationRemoteDataSource remoteDataSource;

  /// Local Data operations for the Internationalization collection
  final InternationalizationLocalDataSource localDataSource;

  /// Network information
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<CurrencyModel>>> getAllCurrencies() async {
    if (await networkInfo.isConnected) {
      /// If there is internet connection, get the currencies from the remote
      /// data source and cache them in the local data source
      return ErrorHandler.handleApiCall(
        () async {
          final currencies = await remoteDataSource.getAllCurrencies();
          await localDataSource.cacheCurrencies(currencies);

          return currencies;
        },
      );
    } else {
      return ErrorHandler.handleCacheCall(
        localDataSource.getAllCurrencies,
      );
    }
  }
}
