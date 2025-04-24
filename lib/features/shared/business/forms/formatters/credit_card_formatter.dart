import 'package:flutter/services.dart';

/// Mask formatter for credit card input fields.
class CreditCardFormatter extends TextInputFormatter {
  /// Mask formatter for credit card input fields.
  CreditCardFormatter({
    required this.mask,
    required this.separator,
  });

  /// Formats the input text to match the credit card mask.
  final String mask;

  /// The separator used in the mask.
  final String separator;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty || newValue.text.length <= oldValue.text.length) {
      return newValue;
    }

    if (newValue.text.length > mask.length) {
      return oldValue;
    }

    final lastCharacter = newValue.text[newValue.text.length - 1];

    if (int.tryParse(lastCharacter) == null) {
      return oldValue;
    }

    final isSeparatorPosition = newValue.text.length < mask.length &&
        mask[newValue.text.length - 1] == separator;

    return isSeparatorPosition
        ? TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          )
        : newValue;
  }
}
