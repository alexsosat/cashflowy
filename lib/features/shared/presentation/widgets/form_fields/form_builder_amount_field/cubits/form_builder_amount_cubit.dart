import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/extensions/num_extension.dart';
import 'form_builder_amount_state.dart';

/// Cubit in charge of handling the amount state of the [FormBuilderAmountField].
class FormBuilderAmountCubit extends Cubit<FormBuilderAmountState> {
  /// Cubit in charge of handling the amount state of the [FormBuilderAmountField].
  FormBuilderAmountCubit({
    required this.decimals,
    double initialValue = 0,
  }) : super(
          FormBuilderAmountState(
            initialValue.toCurrencyString(decimalDigits: decimals),
          ),
        );

  /// The number of decimals to be used in the amount
  final int decimals;

  /// True if the input is a valid number
  bool decimalCheck(String input) {
    var splitInputs = input.split(" ");
    for (String splitInput in splitInputs) {
      if ('.'.allMatches(splitInput).length > 1) {
        return false;
      }
    }
    return true;
  }
}
