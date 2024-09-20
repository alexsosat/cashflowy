import "package:fpdart/fpdart.dart";

import "../../../../core/constants/classes/use_case.dart";
import "../../../../core/errors/failure.dart";
import "../../data/models/params/report_params.dart";
import "../entities/report_entity.dart";
import "../repositories/report_repository.dart";

class GetReport implements UseCase<ReportEntity, ReportParams> {
  final ReportRepository reportRepository;

  GetReport({required this.reportRepository});

  @override
  Future<Either<Failure, ReportEntity>> call({
    required ReportParams params,
  }) {
    
    // TODO: implement call
    throw UnimplementedError();
    
    
  }
}
