/// Types of accounts that can be created
///
/// Each type has a diferent configuration for registering and for operations
enum AccountType {
  /// Cash account, for accounts with physical money
  cash,

  /// Debit acconts, the user has virtual money and a card account
  debit,

  /// Money that the user does not posses and it is a credit from the bank
  credit,
}
