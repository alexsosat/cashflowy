import "package:fpdart/fpdart.dart";

import "../../../../core/constants/classes/use_case.dart";
import "../../../../core/errors/failure.dart";
import "../../data/models/params/category_params.dart";
import "../entities/category_entity.dart";
import "../repositories/category_repository.dart";

class GetCategory implements UseCase<CategoryEntity, CategoryParams> {
  final CategoryRepository categoryRepository;

  GetCategory({required this.categoryRepository});

  @override
  Future<Either<Failure, CategoryEntity>> call({
    required CategoryParams params,
  }) {
    
    // TODO: implement call
    throw UnimplementedError();
    
    
  }
}
