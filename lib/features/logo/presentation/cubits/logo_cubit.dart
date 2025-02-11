import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../core/cubit_states/state_mixin.dart";
import "../../business/entities/logo_entity.dart";

class LogoCubit extends Cubit<StateMixin<LogoEntity>> {
  LogoCubit() : super(StateMixin<LogoEntity>.loading());
}
