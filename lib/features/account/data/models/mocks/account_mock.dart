import "package:drift/drift.dart";

import "../../../../../core/constants/classes/mock_data.dart";
import "../../../business/entities/account_type.dart";

/// Mock data for the [AccountItemsCompanion]
class AccountMock implements MockData<AccountItemsCompanion> {
  @override
  AccountItemsCompanion mockData() => AccountItemsCompanion.insert(
        name: faker.lorem.words(3).join(" "),
        currency: "mxn",
        color: Value(
          faker.color.color(),
        ),
        type: Value(
          faker.randomGenerator.element(AccountType.values),
        ),
      );
}
