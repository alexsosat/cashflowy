import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/params/params.dart';
import '../entities/logo_entity.dart';

/// Data operations for the Logo collection
abstract class LogoRepository {
  /// Retrieves all logos
  Future<Either<Failure, List<LogoEntity>>> getAllLogos();

  /// Creates a new logo
  Future<Either<Failure, bool>> createLogo({
    required CreateLogoParams params,
  });

  /// Downloads a logo image from source
  Future<Either<Failure, bool>> downloadLogo({
    required DownloadLogoParams params,
  });
}
