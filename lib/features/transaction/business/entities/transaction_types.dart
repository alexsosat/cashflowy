/// Types of transactions the user can make
enum TransactionTypes {
  /// Default type
  ///
  /// This type is used for one time transactions
  normal,

  /// Type of transactions that are yet to be made
  ///
  /// This type is used for transactions that are scheduled to be made in the future
  upcoming,

  /// Type of transactions that are made periodically
  ///
  /// This type is used for transactions that are made periodically
  repetitive,

  /// Type of transactions that are made to pay debts
  lent,

  /// Type of transactions that are made to borrow money
  borrowed,

  /// Type of transactions that are made to invest money
  investment,
}
