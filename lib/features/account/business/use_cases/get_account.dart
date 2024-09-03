import "package:fpdart/fpdart.dart";

import "../../../../core/constants/classes/use_case.dart";
import "../../../../core/errors/failure.dart";
import "../../data/models/params/account_params.dart";
import "../entities/account_entity.dart";
import "../repositories/account_repository.dart";

/// Use case to get the account data
class GetAccount implements UseCase<AccountEntity, AccountParams> {
  /// Use case to get the account data
  GetAccount({
    required this.accountRepository,
  });

  /// Account repository to make the request
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, AccountEntity>> call({
    required AccountParams params,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
