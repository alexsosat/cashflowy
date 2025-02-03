// ignore_for_file: constant_identifier_names

/// Types of accounts that can be created
///
/// Each type has a diferent configuration for registering and for operations
enum AccountTypeEnum {
  /// Cash account, for accounts with physical money
  CASH,

  /// Account that is linked to a bank account
  CARD,

  /// Money that the user does not posses and it is a credit from the bank
  INVESTMENT,
}
