import 'package:equatable/equatable.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../../../../../../core/services/logger/logger_service.dart';

/// State of the [FormBuilderAmountCubit]
class FormBuilderAmountState extends Equatable {
  /// State of the [FormBuilderAmountCubit]
  const FormBuilderAmountState(
    this.amountOperator,
  );

  /// The value of the state
  final String amountOperator;

  /// The value of the state as a double
  double get amount {
    if (amountOperator.isEmpty) return 0;

    if (_includesOperations(amountOperator, false)) {
      return _calculateResult(amountOperator);
    } else {
      return double.tryParse(amountOperator) ?? 0;
    }
  }

  @override
  List<Object?> get props => [
        amountOperator,
      ];

  @override
  String toString() => 'FormBuilderAmountState(value: $amountOperator)';

  /// Retrieve the operators list of the calculator
  List<String> retrieveOperations(bool includeDecimal) => [
        "÷",
        "×",
        "-",
        "+",
        (includeDecimal ? "." : "+"),
      ];

  /// True if the input contains an operator symbol
  bool _includesOperations(String input, bool includeDecimal) {
    if (_onlyOneOperationAndIsNegativeSign(input)) return false;

    for (String operation in retrieveOperations(includeDecimal)) {
      if (input.contains(operation)) {
        return true;
      }
    }
    return false;
  }

  /// True if the only operator present on the state is a leading negative sign
  bool _onlyOneOperationAndIsNegativeSign(String input) {
    if (input.startsWith("-")) {
      final operationCount = retrieveOperations(false).fold<int>(
        0,
        (count, operation) => count + input.split(operation).length - 1,
      );

      if (operationCount == 1 && input.contains("-")) {
        return true;
      }
    }

    return false;
  }

  double _calculateResult(String input) {
    if (input.isEmpty) return 0;

    final Logger logger = getLogger("calculate result");

    String changedInput = input;
    if (_includesOperations(input.substring(input.length - 1), true)) {
      changedInput = input.substring(0, input.length - 1);
    }
    changedInput = changedInput.replaceAll("÷", "/");
    changedInput = changedInput.replaceAll("×", "*");
    double result = 0;
    try {
      final cm = ContextModel();
      final parser = Parser();
      final exp = parser.parse(changedInput);
      result = exp.evaluate(EvaluationType.REAL, cm);
    } catch (e) {
      logger.e(
        "Error parsing expression: $changedInput",
        error: e,
      );
    }
    if (_onlyOneOperationAndIsNegativeSign(input) && result == 0) {
      return -0;
    }
    return result;
  }
}
