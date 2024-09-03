import "package:shared_preferences/shared_preferences.dart";

/// Local data source for the Account collection
abstract class AccountLocalDataSource {}

/// Local data source for the Account collection
class AccountLocalDataSourceImpl implements AccountLocalDataSource {
  /// Local data source for the Account collection
  AccountLocalDataSourceImpl({required this.localSource});

  /// Shared preferences instance
  final SharedPreferences localSource;
}
