import 'dart:io';

import 'package:path_provider/path_provider.dart' as path;

/// Class to help with the filesystem paths
class FilesystemPathService {
  /// Get the path of the application's documents directory
  Future<Directory> getDocumentsDirectory() =>
      path.getApplicationDocumentsDirectory();

  /// Get the path of the application's temporary directory
  Future<Directory> getTemporaryDirectory() => path.getTemporaryDirectory();

  /// Get the path of the application's external storage directory
  Future<Directory?> getDownloadsDirectory() => path.getDownloadsDirectory();
}
