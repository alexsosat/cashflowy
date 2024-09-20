





import "../../business/repositories/category_repository.dart";
import "../data_sources/local/category_local_data_source.dart";



/// Data operations for the Category collection
class CategoryRepositoryImpl implements CategoryRepository {
  /// Data operations for the Category collection
  CategoryRepositoryImpl({
    
    required this.localDataSource,
    
  });
  

final CategoryLocalDataSource localDataSource;


  

  
}
