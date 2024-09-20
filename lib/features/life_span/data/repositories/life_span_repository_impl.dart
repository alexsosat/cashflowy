





import "../../business/repositories/life_span_repository.dart";
import "../data_sources/local/life_span_local_data_source.dart";



/// Data operations for the LifeSpan collection
class LifeSpanRepositoryImpl implements LifeSpanRepository {
  /// Data operations for the LifeSpan collection
  LifeSpanRepositoryImpl({
    
    required this.localDataSource,
    
  });
  

final LifeSpanLocalDataSource localDataSource;


  

  
}
