import "package:shared_preferences/shared_preferences.dart";

/// Local data source for the LifeSpan collection
abstract class LifeSpanLocalDataSource {}

/// Local data source for the LifeSpan collection
class LifeSpanLocalDataSourceImpl implements LifeSpanLocalDataSource {
  /// Local data source for the LifeSpan collection
  LifeSpanLocalDataSourceImpl({required this.localSource});

  /// Shared preferences instance
  final SharedPreferences localSource;
}
