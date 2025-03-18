// ignore_for_file: one_member_abstracts

export "package:faker/faker.dart";
export "../../services/database/app_database.dart";

/// Base class that simulates the mocking of a data object
abstract class MockData<T> {
  /// Mock data
  T mockData();
}
