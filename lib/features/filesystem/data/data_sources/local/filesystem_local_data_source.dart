import 'dart:io';

import 'package:path_provider/path_provider.dart' as path;

import '../../../../../core/errors/app_exception.dart';
import '../../../../../core/localization/l10n.dart';
import '../../../../logo/data/models/params/params.dart';

/// Local data source for the Filesystem collection
abstract class FilesystemLocalDataSource {
  /// Get logos Directory
  ///
  /// Returns a [Directory] that is the path where the logos are saved
  /// The logos have three different directories:
  /// - The merchants directory
  /// - The banks directory
  /// - The issuer directory
  /// - The other directory
  Future<Directory> getLogosDirectory({
    required GetLogoDirectoryParams params,
  });
}

/// Local data source for the Filesystem collection
class FilesystemLocalDataSourceImpl implements FilesystemLocalDataSource {
  /// Local data source for the Filesystem collection
  FilesystemLocalDataSourceImpl();

  /// Get the path of the application's documents directory
  Future<Directory> get getDocumentsDirectory =>
      path.getApplicationDocumentsDirectory();

  /// Get the path of the application's external storage directory
  Future<Directory?> get getDownloadsDirectory => path.getDownloadsDirectory();

  /// Get the path of the application's temporary directory
  Future<Directory> get getTemporaryDirectory => path.getTemporaryDirectory();

  @override
  Future<Directory> getLogosDirectory({
    required GetLogoDirectoryParams params,
  }) async {
    try {
      final baseDir = await getDocumentsDirectory;

      final categoryDir =
          Directory('${baseDir.path}/${params.category.name.toLowerCase()}');

      final exists = categoryDir.existsSync();

      if (!exists) {
        categoryDir.createSync(
          recursive: true,
        );
      }

      return categoryDir;
    } catch (e) {
      throw CacheException(
        title: AppLocalizations.current.logoDirectoryErrorTitle,
        message: e.toString(),
      );
    }
  }
}
