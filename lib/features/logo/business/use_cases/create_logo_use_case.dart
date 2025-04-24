import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/localization/l10n.dart';
import '../../../filesystem/business/repositories/filesystem_repository.dart';
import '../../data/models/params/create_logo_params.dart';
import '../../data/models/params/download_logo_params.dart';
import '../repositories/logo_repository.dart';
import 'download_logo_use_case.dart';

/// Use case for registering a new logo
class CreateLogoUseCase extends UseCaseAsync<bool, CreateLogoParams> {
  /// Use case for registering a new logo
  CreateLogoUseCase({
    required this.logoRepository,
    required this.fyleSystemRepository,
  });

  /// Logo repository to make the request
  final LogoRepository logoRepository;

  /// FyleSystem repository to get the logo directory
  final FilesystemRepository fyleSystemRepository;

  @override
  Future<Either<Failure, bool>> call({
    required CreateLogoParams params,
  }) async {
    if (!params.form.validate()) {
      return Left(
        AppFailure.invalidForm(
          params.form.errorList!.join("\n"),
        ),
      );
    }

    final downloadResponse = await DownloadLogoUseCase(
      logoRepository: logoRepository,
      fyleSystemRepository: fyleSystemRepository,
    ).call(
      params: DownloadLogoParams(
        domain: params.form.domainInput.value!,
        category: params.form.categoryInput.value!,
      ),
    );

    late String path;

    downloadResponse.fold(
      (l) => failure = l,
      (r) => path = r,
    );

    if (failure != null) {
      return Left(failure!);
    } else if (path.isEmpty) {
      return Left(
        AppFailure.unexpected(
          AppLocalizations.current.appDirectoryNotFound,
        ),
      );
    }

    return logoRepository.createLogo(
      params: params,
    );
  }
}
