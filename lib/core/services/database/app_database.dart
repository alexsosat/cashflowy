import "package:drift/drift.dart";

import "../../../features/account/business/entities/enums/account_type_enum.dart";
import "../../../features/account/data/data_sources/local/tables/account_table.dart";
import "../../../features/account/data/models/mocks/account_mock.dart";

part "app_database.g.dart";

/// Database class to manage the database operations
@DriftDatabase(
  tables: [
    AccountTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Database class to manage the database operations
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();

          // Add a bunch of default items in a batch
          await batch(
            (b) {
              b.insertAll(
                accountTable,
                List.generate(3, (_) => AccountMock().mockData()),
              );
            },
          );
        },
      );
}
