import "dart:convert";

import "package:shared_preferences/shared_preferences.dart";

import "../../models/models.dart";
import "internationalization_local_data_keys.dart";

/// Local data source for the Internationalization collection
abstract class InternationalizationLocalDataSource {
  /// Retrieves all available currencies
  List<CurrencyModel> getAllCurrencies();

  /// Caches the currencies
  Future<void> cacheCurrencies(List<CurrencyModel> currencies);
}

/// Local data source for the Internationalization collection
class InternationalizationLocalDataSourceImpl
    implements InternationalizationLocalDataSource {
  /// Local data source for the Internationalization collection
  InternationalizationLocalDataSourceImpl({
    required this.localSource,
  });

  /// Shared preferences instance
  final SharedPreferencesWithCache localSource;

  @override
  Future<void> cacheCurrencies(List<CurrencyModel> currencies) async {
    final mapCurrencies = {};

    for (final CurrencyModel currency in currencies) {
      mapCurrencies[currency.code] = currency.name;
    }

    await localSource.setString(
      InternationalizationLocalDataKeys.currencies,
      jsonEncode(mapCurrencies),
    );
  }

  @override
  List<CurrencyModel> getAllCurrencies() {
    final response = jsonDecode(
      localSource.getString(
            InternationalizationLocalDataKeys.currencies,
          ) ??
          "{}",
    );

    final mapCurrencies = response.data as Map<String, String>;
    final List<CurrencyModel> currencies = [];
    for (final MapEntry<String, String> map in mapCurrencies.entries) {
      currencies.add(
        CurrencyModel.fromMapEntry(map: map),
      );
    }

    return currencies;
  }
}
