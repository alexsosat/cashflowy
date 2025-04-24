import "package:drift/drift.dart";

import "../../../../../core/errors/app_exception.dart";
import "../../../../../core/localization/l10n.dart";
import "../../../../../core/services/database/app_database.dart";
import "../../../../../core/services/logger/logger_service.dart";
import "../../models/dtos/logo_model.dart";
import "../../models/params/params.dart";

/// Local data source for the Logo collection
abstract class LogoLocalDataSource {
  /// Retrieves all logos
  Future<List<LogoModel>> getAllLogos();

  /// Creates a new logo
  Future<bool> createLogo({
    required CreateLogoParams params,
  });
}

/// Local data source for the Logo collection
class LogoLocalDataSourceImpl implements LogoLocalDataSource {
  /// Local data source for the Logo collection
  LogoLocalDataSourceImpl({
    required this.localSource,
  });

  /// Shared preferences instance
  final AppDatabase localSource;

  final _logger = getLogger("LogoLocalDataSourceImpl");

  @override
  Future<List<LogoModel>> getAllLogos() async {
    try {
      final logosQuery = await localSource.logoTable.all().get();

      final logos = logosQuery.map(LogoModel.fromTable).toList();

      _logger.i("Logos: $logos");

      return logos;
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.logosRetrieveAllError,
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> createLogo({
    required CreateLogoParams params,
  }) async {
    try {
      await localSource.into(localSource.logoTable).insert(
            params.toCompanion(),
          );

      return true;
    } catch (e) {
      throw DriftException(
        title: AppLocalizations.current.createLogoErrorTitle,
        message: e.toString(),
      );
    }
  }
}
