import "package:fpdart/fpdart.dart";

import "../../../../core/constants/classes/use_case.dart";
import "../../../../core/errors/failure.dart";
import "../../data/models/params/life_span_params.dart";
import "../entities/life_span_entity.dart";
import "../repositories/life_span_repository.dart";

class GetLifeSpan implements UseCase<LifeSpanEntity, LifeSpanParams> {
  final LifeSpanRepository lifeSpanRepository;

  GetLifeSpan({required this.lifeSpanRepository});

  @override
  Future<Either<Failure, LifeSpanEntity>> call({
    required LifeSpanParams params,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
