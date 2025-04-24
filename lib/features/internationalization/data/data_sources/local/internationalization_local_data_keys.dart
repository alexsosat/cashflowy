import '../../../../../core/constants/classes/local_data_source_keys.dart';

/// Keys for the local data source for the onboarding process
class InternationalizationLocalDataKeys implements LocalDataSourceKeys {
  /// Key for knowing if is the first time the user opens the app
  static const currencies = "CURRENCIES";

  @override
  Set<String> get keys => {
        currencies,
      };
}
