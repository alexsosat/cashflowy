import "dart:convert";

import "../../../business/entities/transaction_entity.dart";

/// Model that transforms the Transaction data from the API to the
/// application entity
class TransactionModel extends TransactionEntity {
  /// Model that transforms the Transaction data from the API to the
  /// application entity
  const TransactionModel();

  

  /// Factory method to create a Home model instance from a JSON
  factory TransactionModel.fromJson({required String json}) => TransactionModel.fromMap(map: jsonDecode(json));

  /// Factory method to create a Transaction model instance from a map
  factory TransactionModel.fromMap({required Map<String, dynamic> map}) =>
     const TransactionModel();

  /// Factory method to create a Transaction model instance from an 
  /// entity
  factory TransactionModel.fromEntity({required TransactionEntity entity}) => const TransactionModel();

  /// Converts the Transaction model instance to a map
  Map<String, dynamic> toMap() => {};

  /// Converts the Home model instance to a JSON
  String toJson() => jsonEncode(toMap());
  
  /// Converts the Transaction model instance to an entity
  TransactionEntity toEntity() => const TransactionEntity();
}
