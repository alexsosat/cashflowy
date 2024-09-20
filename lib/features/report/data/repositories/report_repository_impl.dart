





import "../../business/repositories/report_repository.dart";
import "../data_sources/local/report_local_data_source.dart";



/// Data operations for the Report collection
class ReportRepositoryImpl implements ReportRepository {
  /// Data operations for the Report collection
  ReportRepositoryImpl({
    
    required this.localDataSource,
    
  });
  

final ReportLocalDataSource localDataSource;


  

  
}
