import "package:drift/drift.dart";

import "../../../../../core/constants/classes/mock_data.dart";
import "../../../business/entities/account_type.dart";

/// Mock data for the [AccountItemsCompanion]
class AccountMock implements MockData<AccountTableCompanion> {
  @override
  AccountTableCompanion mockData() => AccountTableCompanion.insert(
        name: faker.lorem.words(3).join(" "),
        currency: "mxn",
        color: Value(
          faker.color.rgbColor(),
        ),
        type: Value(
          faker.randomGenerator.element(AccountType.values),
        ),
      );
}
