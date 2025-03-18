import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/localization/l10n.dart';
import '../../../filesystem/business/repositories/filesystem_repository.dart';
import '../../../filesystem/business/use_cases/get_logos_directory_use_case.dart';
import '../../data/models/params/params.dart';
import '../repositories/logo_repository.dart';

/// Use case for downloading a logo
///
/// Returns a [Failure] if the use case fails
/// Returns a [String] that is the path where the logo was saved if the use case succeeds
class DownloadLogoUseCase extends UseCaseAsync<String, DownloadLogoParams> {
  /// Use case for downloading a logo
  ///
  /// Returns a [Failure] if the use case fails
  /// Returns a [String] that is the path where the logo was saved if the use case succeeds
  DownloadLogoUseCase({
    required this.logoRepository,
    required this.fyleSystemRepository,
  });

  /// Logo repository to download the logo
  final LogoRepository logoRepository;

  /// Fylesystem repository to get the logo directory
  final FilesystemRepository fyleSystemRepository;

  @override
  Future<Either<Failure, String>> call({
    required DownloadLogoParams params,
  }) async {
    final directoryResponse = await GetLogosDirectoryUseCase(
      repository: fyleSystemRepository,
    ).call(
      params: GetLogoDirectoryParams(
        category: params.category,
      ),
    );

    directoryResponse.fold(
      (l) => failure = l,
      (r) => params.directory = r,
    );

    if (failure != null) {
      return Left(failure!);
    } else if (params.directory == null) {
      return Left(
        AppFailure.unexpected(
          AppLocalizations.current.appDirectoryNotFound,
        ),
      );
    }

    final downloadResponse = await logoRepository.downloadLogo(
      params: params,
    );

    downloadResponse.fold(
      (l) => failure = l,
      (r) {},
    );

    if (failure != null) {
      return Left(failure!);
    }

    return Right(params.directory!.path);
  }
}
