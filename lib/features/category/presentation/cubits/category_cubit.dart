import "package:flutter_bloc/flutter_bloc.dart";


import "../../../../core/cubit_states/state_mixin.dart";
import "../../business/entities/category_entity.dart";



class CategoryCubit extends Cubit<StateMixin<CategoryEntity>> {
  
  CategoryCubit() : super(StateMixin<CategoryEntity>.loading());

  
}
