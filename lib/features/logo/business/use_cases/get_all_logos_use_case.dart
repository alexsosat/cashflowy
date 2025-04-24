import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../shared/shared.dart';
import '../entities/logo_entity.dart';
import '../repositories/logo_repository.dart';

/// Use case for retrieving all logos
class GetAllLogosUseCase extends UseCaseAsync<List<LogoEntity>, NoParams> {
  /// Use case for retrieving all logos
  GetAllLogosUseCase({
    required this.logoRepository,
  });

  /// Logo repository to retrieve all logos
  final LogoRepository logoRepository;

  @override
  Future<Either<Failure, List<LogoEntity>>> call({
    required NoParams params,
  }) =>
      logoRepository.getAllLogos();
}
