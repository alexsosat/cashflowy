import "dart:io";

import "package:drift/drift.dart";
import "package:drift/native.dart";
import 'package:path/path.dart' as p;
import "package:path_provider/path_provider.dart";

import "../../../features/account/business/entities/account_type.dart";
import "../../../features/account/data/data_sources/local/tables/account_table.dart";
import "../../../features/account/data/models/mocks/account_mock.dart";
import "../../../features/bank/data/data_sources/tables/bank_table.dart";
import "../../../features/category/data/data_sources/local/tables/category_table.dart";
import "../../../features/life_span/business/entities/life_span_units.dart";
import "../../../features/life_span/data/data_sources/local/tables/life_span_table.dart";
import "../../../features/notification/data/data_sources/local/tables/regex_values_table.dart";
import "../../../features/notification/data/data_sources/local/tables/tables.dart";
import "../../../features/report/data/data_sources/local/tables/account_report_table.dart";
import "../../../features/transaction/business/entities/transaction_types.dart";
import "../../../features/transaction/data/data_sources/local/tables/transaction_table.dart";

part "app_database.g.dart";

/// Database class to manage the database operations
@DriftDatabase(
  tables: [
    AccountTable,
    BankTable,
    CategoryTable,
    LifeSpanTable,
    AccountReportTable,
    TransactionTable,
    AppNotificationTable,
    AppRegexTable,
    RegexValuesTable,
    NotificationTable,
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

/// Construct the database
Future<AppDatabase> constructDb() async {
  // the LazyDatabase util lets us find the right location for the file async.
  final db = LazyDatabase(
    () async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'cashflowy_db.sqlite'));

      final foregroundExecutor = NativeDatabase(file);
      final backgroundExecutor = NativeDatabase.createInBackground(file);

      return MultiExecutor(
        read: foregroundExecutor,
        write: backgroundExecutor,
      );
    },
  );

  return AppDatabase(db);
}
