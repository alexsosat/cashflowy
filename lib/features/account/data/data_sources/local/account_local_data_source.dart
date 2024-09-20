import "../../../../../core/services/database/app_database.dart";

/// Local data source for the Account collection
abstract class AccountLocalDataSource {
  /// Returns the list of accounts
  Future<List<AccountItem>> getAllAccounts();
}

/// Local data source for the Account collection
class AccountLocalDataSourceImpl implements AccountLocalDataSource {
  /// Local data source for the Account collection
  AccountLocalDataSourceImpl({required this.database});

  /// Shared preferences instance
  final AppDatabase database;

  @override
  Future<List<AccountItem>> getAllAccounts() async =>
      database.select(database.accountItems).get();
}
