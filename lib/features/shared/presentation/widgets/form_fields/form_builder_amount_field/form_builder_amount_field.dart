import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/extensions/num_extension.dart';

/// Field that displays a calculador to input an amount
class FormBuilderAmountField extends StatelessWidget {
  /// Field that displays a calculador to input an amount
  const FormBuilderAmountField({
    required this.name,
    required this.label,
    this.decimals = 2,
    this.initialValue = 0,
    super.key,
  });

  /// Name of the field
  final String name;

  /// Label of the field
  final String label;

  /// The number of decimals to be used in the amount
  final int decimals;

  /// The initial value of the amount
  final double initialValue;

  @override
  Widget build(BuildContext context) => FormBuilderField<double>(
        name: name,
        initialValue: initialValue,
        builder: (state) => InkWell(
          onTap: () => _onTapped(context, state),
          child: InputDecorator(
            isEmpty: state.value == null || state.value == 0,
            decoration: InputDecoration(
              labelText: label,
              errorText: state.errorText,
            ),
            child: Text(state.value?.toCurrencyString() ?? ""),
          ),
        ),
      );

  /// Called when the field is tapped
  void _onTapped(BuildContext context, FormFieldState<double> state) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SimpleCalculator(
        value: state.value ?? 0,
        numberFormat: NumberFormat.decimalPattern(
          "es_MX",
        ),
        onChanged: (key, value, expression) => state.didChange(value),
      ),
    );
  }
}
