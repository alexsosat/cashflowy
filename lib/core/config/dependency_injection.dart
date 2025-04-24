import "dart:io";

import "package:drift/native.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:internet_connection_checker_plus/internet_connection_checker_plus.dart";
import "package:shared_preferences/shared_preferences.dart";

import "../../features/internationalization/data/data_sources/local/internationalization_local_data_keys.dart";
import "../../features/internationalization/internationalization.dart";
import "../../features/logo/business/repositories/logo_repository.dart";
import "../../features/logo/data/data_sources/local/logo_local_data_source.dart";
import "../../features/logo/data/data_sources/remote/logo_remote_data_source.dart";
import "../../features/logo/data/repositories/logo_repository_impl.dart";
import "../adapters/dio_adapter.dart";
import "../services/connection/network_info.dart";
import "../services/database/app_database.dart";
import "../services/local_notifications/local_notifications_service.dart";
import "../services/notification_listener/notification_listener_service.dart";

/// Class to inject the dependencies in the application
class DependencyInjection {
  /// Inject the services in the application
  static void injectCriticalServices() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  /// Initialize the services in the application
  static Future<void> injectServices() async {
    GetIt.I.registerSingleton(
      AppDatabase(
        NativeDatabase.memory(),
      ),
    );

    if (Platform.isAndroid) {
      await NotificationListenerService.init();
    }

    await LocalNotificationsService().initLocalNotificationsService();

    GetIt.I.registerSingleton<SharedPreferencesWithCache>(
      await SharedPreferencesWithCache.create(
        cacheOptions: SharedPreferencesWithCacheOptions(
          allowList: {
            ...InternationalizationLocalDataKeys().keys,
          },
        ),
      ),
    );
  }

  /// Inject the repositories in the application
  ///
  /// This injects the repositories when the application is running
  /// These repositories are loaded during the splash screen
  static void injectRepositories() {
    final appDatabase = GetIt.I.get<AppDatabase>();
    final sharedPreferencesInstance = GetIt.I.get<SharedPreferencesWithCache>();

    final internetInfo = NetworkInfoImpl(InternetConnection());

    GetIt.I.registerSingleton<LogoRepository>(
      LogoRepositoryImpl(
        remoteDataSource: LogoRemoteDataSourceImpl(
          dio: DioAdapter(
            internetInfo: internetInfo,
          ),
        ),
        localDataSource: LogoLocalDataSourceImpl(
          localSource: appDatabase,
        ),
        networkInfo: internetInfo,
      ),
    );

    GetIt.I.registerSingleton<InternationalizationRepository>(
      InternationalizationRepositoryImpl(
        remoteDataSource: InternationalizationRemoteDataSourceImpl(
          dio: DioAdapter(
            internetInfo: internetInfo,
          ),
        ),
        localDataSource: InternationalizationLocalDataSourceImpl(
          localSource: sharedPreferencesInstance,
        ),
        networkInfo: internetInfo,
      ),
    );
  }
}
