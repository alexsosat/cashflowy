import "package:shared_preferences/shared_preferences.dart";

/// Local data source for the Home collection
abstract class HomeLocalDataSource {}

/// Local data source for the Home collection
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  /// Local data source for the Home collection
  HomeLocalDataSourceImpl({required this.localSource});

  /// Shared preferences instance
  final SharedPreferences localSource;
}
