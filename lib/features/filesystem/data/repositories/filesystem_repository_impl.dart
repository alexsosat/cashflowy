import "dart:io";

import "package:fpdart/fpdart.dart";

import "../../../../core/errors/error_handler.dart";
import "../../../../core/errors/failure.dart";
import "../../business/repositories/filesystem_repository.dart";
import "../data_sources/local/filesystem_local_data_source.dart";
import "../models/params/get_logo_directory_params.dart";

/// Data operations for the Filesystem collection
class FilesystemRepositoryImpl implements FilesystemRepository {
  /// Data operations for the Filesystem collection
  FilesystemRepositoryImpl({
    required this.localDataSource,
  });

  /// Local data source to make the request
  final FilesystemLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Directory>> getLogosDirectory({
    required GetLogoDirectoryParams params,
  }) =>
      ErrorHandler.handleCacheCallAsync(
        () => localDataSource.getLogosDirectory(params: params),
      );
}
