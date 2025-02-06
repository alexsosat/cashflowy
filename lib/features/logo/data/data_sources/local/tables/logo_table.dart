import 'package:drift/drift.dart';

import '../../../../business/entities/enums/logo_category_enum.dart';

/// This is the table where the logo information will be stored
class LogoTable extends Table {
  /// Unique identifier of the logo
  late final id = integer().autoIncrement()();

  /// Name of the logo
  late final name = text().withLength(min: 1, max: 50)();

  /// Path of the logo
  late final path = text().withLength(min: 1, max: 256).nullable()();

  /// Url of the logo
  late final url = text().withLength(min: 1, max: 256)();

  /// Category of the logo
  late final category = intEnum<LogoCategoryEnum>()();
}
