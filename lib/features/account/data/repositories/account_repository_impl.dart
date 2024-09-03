import "../../business/repositories/account_repository.dart";
import "../data_sources/local/account_local_data_source.dart";

/// Data operations for the Account collection
class AccountRepositoryImpl implements AccountRepository {
  /// Data operations for the Account collection
  AccountRepositoryImpl({
    required this.localDataSource,
  });

  /// Local data source to make the operations
  final AccountLocalDataSource localDataSource;
}
