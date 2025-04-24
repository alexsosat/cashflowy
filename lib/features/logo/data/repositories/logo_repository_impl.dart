import "package:fpdart/fpdart.dart";

import "../../../../core/errors/error_handler.dart";
import "../../../../core/errors/failure.dart";
import "../../../../core/services/connection/network_info.dart";

import "../../business/repositories/logo_repository.dart";
import "../data_sources/local/logo_local_data_source.dart";
import "../data_sources/remote/logo_remote_data_source.dart";
import "../models/dtos/logo_model.dart";
import "../models/params/params.dart";

/// Data operations for the Logo collection
class LogoRepositoryImpl implements LogoRepository {
  /// Data operations for the Logo collection
  LogoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// Remote data source for the Logo collection
  final LogoRemoteDataSource remoteDataSource;

  /// Local data source for the Logo collection
  final LogoLocalDataSource localDataSource;

  /// Network information
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<LogoModel>>> getAllLogos() =>
      ErrorHandler.handleDriftCall(
        localDataSource.getAllLogos,
      );

  @override
  Future<Either<Failure, bool>> createLogo({
    required CreateLogoParams params,
  }) =>
      ErrorHandler.handleDriftCall(
        () => localDataSource.createLogo(params: params),
      );

  @override
  Future<Either<Failure, bool>> downloadLogo({
    required DownloadLogoParams params,
  }) =>
      ErrorHandler.handleApiCall(
        () => remoteDataSource.downloadLogo(params: params),
      );
}
