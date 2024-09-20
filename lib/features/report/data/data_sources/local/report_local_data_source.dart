import "dart:convert";
import "package:shared_preferences/shared_preferences.dart";



/// Local data source for the Report collection
abstract class ReportLocalDataSource {

  

  

}



/// Local data source for the Report collection
class ReportLocalDataSourceImpl implements ReportLocalDataSource {
  /// Local data source for the Report collection
  ReportLocalDataSourceImpl({required this.localSource});

  /// Shared preferences instance
  final SharedPreferences localSource;

  

  

}
