import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/extensions/num_extension.dart';
import '../../../../../../core/extensions/string_extension.dart';
import '../../../../../../core/extensions/theme_extension.dart';
import '../../../../../../core/localization/l10n.dart';

/// Field that displays a calculador to input an amount
class FormBuilderAmountField extends StatefulWidget {
  /// Field that displays a calculador to input an amount
  const FormBuilderAmountField({
    required this.name,
    required this.label,
    this.initialValue = 0,
    this.symbol = r"$",
    this.decimalDigits = 2,
    this.onChanged,
    super.key,
  });

  /// Name of the field
  final String name;

  /// Label of the field
  final String label;

  /// The initial value of the amount
  final double initialValue;

  /// Symbol to show in the field
  final String symbol;

  /// Decimal digits to show in the field
  final int decimalDigits;

  /// Callback when the value is changed
  final ValueChanged<double?>? onChanged;

  @override
  State<FormBuilderAmountField> createState() => FormBuilderAmountFieldState();
}

/// State of the [FormBuilderAmountField]
class FormBuilderAmountFieldState extends State<FormBuilderAmountField> {
  /// The state of the field
  late FormFieldState<double> _fieldState;

  @override
  Widget build(BuildContext context) => FormBuilderField<double>(
        name: widget.name,
        initialValue: widget.initialValue,
        builder: (state) {
          _fieldState = state;
          return InkWell(
            onTap: openCalculator,
            child: InputDecorator(
              isEmpty: _fieldState.value == null,
              decoration: InputDecoration(
                labelText: widget.label,
                errorText: _fieldState.errorText,
              ),
              child: Text(
                _fieldState.value?.toCurrencyString(
                      symbol: "${widget.symbol} ",
                      decimalDigits: widget.decimalDigits,
                    ) ??
                    "",
              ),
            ),
          );
        },
      );

  /// Called when the field is tapped
  Future openCalculator() async {
    final newValue = await showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => _BottomSheetCalculator(
        label: widget.label,
        initialValue: _fieldState.value,
      ),
    );

    if (newValue == null) return;

    _fieldState.didChange(newValue);

    widget.onChanged?.call(newValue);
  }
}

class _BottomSheetCalculator extends StatefulWidget {
  const _BottomSheetCalculator({
    required this.label,
    this.initialValue,
  });

  /// Label of the field
  final String label;

  /// Initial value of the calculator
  final double? initialValue;

  @override
  State<_BottomSheetCalculator> createState() => _BottomSheetCalculatorState();
}

class _BottomSheetCalculatorState extends State<_BottomSheetCalculator> {
  /// Current value of the calculator
  double? _currentValue;

  @override
  void initState() {
    _currentValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Text(
              widget.label,
              style: context.textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: SimpleCalculator(
              value: widget.initialValue ?? 0,
              hideSurroundingBorder: true,
              autofocus: true,
              numberFormat: NumberFormat.decimalPattern(
                "es_MX",
              ),
              onChanged: _onValueChanged,
            ),
          ),
          SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: _onCancel,
                  child: Text(
                    AppLocalizations.current.cancel.toCapitalized(),
                  ),
                ),
                TextButton(
                  onPressed: _onConfirm,
                  child: Text(
                    AppLocalizations.current.confirm.toCapitalized(),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  void _onValueChanged(String? key, double? value, String? expression) {
    _currentValue = value;
  }

  void _onCancel() => context.router.maybePop();

  void _onConfirm() {
    if (_currentValue == null) {
      context.router.maybePop();
      return;
    }

    context.router.maybePop(_currentValue);
  }
}
