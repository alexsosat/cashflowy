

import "../../../../core/services/connection/network_info.dart";



import "../../business/repositories/logo_repository.dart";
import "../data_sources/local/logo_local_data_source.dart";
import "../data_sources/remote/logo_remote_data_source.dart";


/// Data operations for the Logo collection
class LogoRepositoryImpl implements LogoRepository {
  /// Data operations for the Logo collection
  LogoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  
final LogoRemoteDataSource remoteDataSource;
final LogoLocalDataSource localDataSource;
final NetworkInfo networkInfo;

  

  
}
