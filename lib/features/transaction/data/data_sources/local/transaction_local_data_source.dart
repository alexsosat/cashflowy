import "package:shared_preferences/shared_preferences.dart";

/// Local data source for the Transaction collection
abstract class TransactionLocalDataSource {}

/// Local data source for the Transaction collection
class TransactionLocalDataSourceImpl implements TransactionLocalDataSource {
  /// Local data source for the Transaction collection
  TransactionLocalDataSourceImpl({required this.localSource});

  /// Shared preferences instance
  final SharedPreferences localSource;
}
