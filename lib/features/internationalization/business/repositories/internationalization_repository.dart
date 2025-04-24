import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/currency_entity.dart';

/// Data operations for the Internationalization collection
abstract class InternationalizationRepository {
  /// Retrieves all available currencies
  Future<Either<Failure, List<CurrencyEntity>>> getAllCurrencies();
}
