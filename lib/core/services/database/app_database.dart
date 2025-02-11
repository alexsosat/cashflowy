import "package:drift/drift.dart";

import "../../../features/account/business/entities/enums/account_type_enum.dart";
import "../../../features/account/business/entities/enums/bank_card_type_enum.dart";
import "../../../features/account/data/data_sources/local/tables/account_card_rel.dart";
import "../../../features/account/data/data_sources/local/tables/account_table.dart";
import "../../../features/account/data/data_sources/local/tables/bank/bank_logo_rel.dart";
import "../../../features/account/data/data_sources/local/tables/bank/bank_table.dart";
import "../../../features/account/data/data_sources/local/tables/card_table/card_bank_rel_table.dart";
import "../../../features/account/data/data_sources/local/tables/card_table/card_credit_rel_table.dart";
import "../../../features/account/data/data_sources/local/tables/card_table/card_issuer_rel_table.dart";
import "../../../features/account/data/data_sources/local/tables/card_table/card_table.dart";
import "../../../features/account/data/data_sources/local/tables/card_table/credit_loan_table.dart";
import "../../../features/account/data/data_sources/local/tables/issuer/issuer_logo_rel.dart";
import "../../../features/account/data/data_sources/local/tables/issuer/issuer_table.dart";
import "../../../features/logo/business/entities/enums/logo_category_enum.dart";
import "../../../features/logo/data/data_sources/local/tables/logo_table.dart";

part "app_database.g.dart";

/// Database class to manage the database operations
@DriftDatabase(
  tables: [
    AccountTable,
    AccountCardRelTable,
    CardTable,
    CardCreditRelTable,
    CreditLoanTable,
    CardIssuerRelTable,
    CardBankRelTable,
    IssuerTable,
    IssuerLogoRel,
    BankTable,
    BankLogoRel,
    LogoTable,
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
            (b) {},
          );
        },
      );
}
