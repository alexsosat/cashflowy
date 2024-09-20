import "package:flutter_bloc/flutter_bloc.dart";


import "../../../../core/cubit_states/state_mixin.dart";
import "../../business/entities/life_span_entity.dart";



class LifeSpanCubit extends Cubit<StateMixin<LifeSpanEntity>> {
  
  LifeSpanCubit() : super(StateMixin<LifeSpanEntity>.loading());

  
}
