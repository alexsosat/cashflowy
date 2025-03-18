import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../filesystem.dart';

/// Use case for retrieving the correct logo directory
class GetLogosDirectoryUseCase
    extends UseCaseAsync<Directory, GetLogoDirectoryParams> {
  /// Use case for retrieving the correct logo directory
  GetLogosDirectoryUseCase({
    required this.repository,
  });

  /// Repository for the Filesystem collection
  final FilesystemRepository repository;

  @override
  Future<Either<Failure, Directory>> call({
    required GetLogoDirectoryParams params,
  }) async =>
      repository.getLogosDirectory(params: params);
}
