import "../../../../../core/adapters/dio_adapter.dart";
import "../../models/models.dart";

/// Remote data source for the Internationalization collection
abstract class InternationalizationRemoteDataSource {
  /// Retrieves all available currencies
  Future<List<CurrencyModel>> getAllCurrencies();
}

/// Remote data source for the Internationalization collection
class InternationalizationRemoteDataSourceImpl
    implements InternationalizationRemoteDataSource {
  /// Remote data source for the Internationalization collection
  InternationalizationRemoteDataSourceImpl({
    required this.dio,
  });

  /// Dio adapter instance
  final DioAdapter dio;

  @override
  Future<List<CurrencyModel>> getAllCurrencies() async {
    final response = await dio.get(
      "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies.json",
    );

    if (response.data is Map) {
      final mapCurrencies = response.data as Map<String, dynamic>;
      final List<CurrencyModel> currencies = [];
      for (final MapEntry<String, dynamic> map in mapCurrencies.entries) {
        currencies.add(
          CurrencyModel.fromMapEntry(map: map),
        );
      }
      return currencies;
    } else {
      throw Exception("Failed to load currencies");
    }
  }
}
