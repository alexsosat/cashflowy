import 'dart:io';

import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/params/params.dart';

/// Data operations for the Filesystem collection
abstract class FilesystemRepository {
  /// Retrieves the logos directory
  Future<Either<Failure, Directory>> getLogosDirectory({
    required GetLogoDirectoryParams params,
  });
}
