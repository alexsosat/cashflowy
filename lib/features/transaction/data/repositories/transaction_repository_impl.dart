





import "../../business/repositories/transaction_repository.dart";
import "../data_sources/local/transaction_local_data_source.dart";



/// Data operations for the Transaction collection
class TransactionRepositoryImpl implements TransactionRepository {
  /// Data operations for the Transaction collection
  TransactionRepositoryImpl({
    
    required this.localDataSource,
    
  });
  

final TransactionLocalDataSource localDataSource;


  

  
}
