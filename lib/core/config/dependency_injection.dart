import "package:drift/native.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

import "../services/database/app_database.dart";

/// Class to inject the dependencies in the application
class DependencyInjection {
  /// Inject the services in the application
  static Future<void> injectCriticalServices() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  /// Initialize the services in the application
  static Future<void> injectServices() async {
    GetIt.I.registerSingleton(
      AppDatabase(
        NativeDatabase.memory(),
      ),
    );
  }

  /// Inject the repositories in the application
  ///
  /// This injects the repositories when the application is running
  /// These repositories are loaded during the splash screen
  static void injectRepositories() {}
}
