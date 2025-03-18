import "../../../../../core/errors/app_exception.dart";
import "../../../../../core/localization/l10n.dart";
import "../../../../../core/services/database/app_database.dart";
import "../../models/dtos/logo_model.dart";
import "../../models/params/params.dart";

/// Local data source for the Logo collection
abstract class LogoLocalDataSource {
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

  @override
  Future<bool> createLogo({
    required CreateLogoParams params,
  }) async {
    try {
      final LogoModel logoModel = LogoModel.fromMap(
        params.toMap(),
      );

      await localSource.into(localSource.logoTable).insert(
            logoModel.toCompanion(),
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
