import "package:intl/intl.dart";

/// A set of useful extensions for the [num] class.
extension NumExtension on num {
  /// Returns a double with two decimal places.
  double get twoDecimalsDouble => double.parse(toStringAsFixed(2));

  /// Converts a number to a currency string
  /// Example: 1000.0.toCurrencyString() -> $ 1,000.00
  String toCurrencyString() {
    final formatter = NumberFormat.simpleCurrency(
      locale: "es_MX",
      decimalDigits: 2,
    );

    final String textFormated = formatter.format(this);

    final String newString = textFormated.replaceAll(RegExp(r"\$"), r"$ ");

    return newString;
  }

  /// Returns true if the number is between the given range.
  ///
  /// Args:
  ///   from (int): The lower bound of the range.
  ///   to (int): The upper bound of the range.
  ///
  /// Returns:
  ///   The boolean value of the expression.
  bool isBetween(num from, num to) => from <= this && this <= to;
}
