import "package:drift/drift.dart";

import "../../../../../core/constants/classes/mock_data.dart";

/// Mock data for the [BankItemsCompanion]
class BankMock extends MockData<BankTableCompanion> {
  @override
  BankTableCompanion mockData() => BankTableCompanion.insert(
        name: faker.company.name(),
        color: Value.absentIfNull(faker.color.rgbColor()),
      );
}
