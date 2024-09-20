import "package:flutter_bloc/flutter_bloc.dart";


import "../../../../core/cubit_states/state_mixin.dart";
import "../../business/entities/transaction_entity.dart";



class TransactionCubit extends Cubit<StateMixin<TransactionEntity>> {
  
  TransactionCubit() : super(StateMixin<TransactionEntity>.loading());

  
}
