import 'package:fpdart/fpdart.dart';

import '../../../../core/constants/classes/use_case.dart';
import '../../../../core/errors/failure.dart';
import '../../../shared/shared.dart';
import '../../internationalization.dart';

/// Use case for retrieving all currencies.
class GetAllCurrenciesUseCase
    extends UseCaseAsync<List<CurrencyEntity>, NoParams> {
  /// Use case for retrieving all currencies.
  GetAllCurrenciesUseCase({
    required this.repository,
  });

  /// Internationalization repository
  final InternationalizationRepository repository;

  @override
  Future<Either<Failure, List<CurrencyEntity>>> call({
    required NoParams params,
  }) =>
      repository.getAllCurrencies();
}
