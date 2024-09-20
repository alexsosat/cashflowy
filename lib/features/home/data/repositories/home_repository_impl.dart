





import "../../business/repositories/home_repository.dart";
import "../data_sources/local/home_local_data_source.dart";



/// Data operations for the Home collection
class HomeRepositoryImpl implements HomeRepository {
  /// Data operations for the Home collection
  HomeRepositoryImpl({
    
    required this.localDataSource,
    
  });
  

final HomeLocalDataSource localDataSource;


  

  
}
