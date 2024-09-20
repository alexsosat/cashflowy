import "package:fpdart/fpdart.dart";

import "../../../../core/constants/classes/use_case.dart";
import "../../../../core/errors/failure.dart";
import "../../data/models/params/transaction_params.dart";
import "../entities/transaction_entity.dart";
import "../repositories/transaction_repository.dart";

class GetTransaction implements UseCase<TransactionEntity, TransactionParams> {
  final TransactionRepository transactionRepository;

  GetTransaction({required this.transactionRepository});

  @override
  Future<Either<Failure, TransactionEntity>> call({
    required TransactionParams params,
  }) {
    
    // TODO: implement call
    throw UnimplementedError();
    
    
  }
}
