import "package:flutter_bloc/flutter_bloc.dart";


import "../../../../core/cubit_states/state_mixin.dart";
import "../../business/entities/report_entity.dart";



class ReportCubit extends Cubit<StateMixin<ReportEntity>> {
  
  ReportCubit() : super(StateMixin<ReportEntity>.loading());

  
}
