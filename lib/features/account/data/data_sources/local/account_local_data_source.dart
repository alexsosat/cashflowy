import "package:drift/drift.dart";

import "../../../../../core/services/database/app_database.dart";
import "../../../business/entities/enums/account_type_enum.dart";
import "../../models/dtos/account_model.dart";

/// Local data source for the Account collection
abstract class AccountLocalDataSource {
  /// Returns the list of cash accounts
  Future<List<AccountModel>> getCashAccounts();

  /// Returns the list of credit accounts
  Future<List<AccountModel>> getCardDebitAccounts();

  /// Returns the list of credit accounts
  Future<List<AccountModel>> getCardCreditAccounts();
}

/// Local data source for the Account collection
class AccountLocalDataSourceImpl implements AccountLocalDataSource {
  /// Local data source for the Account collection
  AccountLocalDataSourceImpl({required this.database});

  /// Shared preferences instance
  final AppDatabase database;

  @override
  Future<List<AccountModel>> getCashAccounts() async {
    final List<AccountTableData> result =
        await database.select(database.accountTable).get()
          ..where((t) => t.typeId == AccountTypeEnum.CASH);

    return result.map(AccountModel.fromDriftMap).toList();
  }

  @override
  Future<List<AccountModel>> getCardDebitAccounts() async {
    final query = await database.select(database.accountTable).join(
      [
        leftOuterJoin(
          database.accountCardRelTable,
          database.accountCardRelTable.accountId
              .equalsExp(database.accountTable.id),
        ),
        leftOuterJoin(
          database.cardTable,
          database.accountCardRelTable.cardId.equalsExp(database.cardTable.id),
        ),
      ],
    ).get()
      ..where(
        (tbl) => tbl.typeId == AccountTypeEnum.CARD,
      );

    final List<AccountTableData> result = q;

    return result.map(AccountModel.fromDriftMap).toList();
  }

  @override
  Future<List<AccountModel>> getCardCreditAccounts() async {
    final List<AccountTableData> result =
        await database.select(database.accountTable).get()
          ..where((t) => t.typeId == AccountTypeEnum.CARD);

    return result.map(AccountModel.fromDriftMap).toList();
  }
}
