import "dart:convert";
import "package:shared_preferences/shared_preferences.dart";



/// Local data source for the Category collection
abstract class CategoryLocalDataSource {

  

  

}



/// Local data source for the Category collection
class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  /// Local data source for the Category collection
  CategoryLocalDataSourceImpl({required this.localSource});

  /// Shared preferences instance
  final SharedPreferences localSource;

  

  

}
