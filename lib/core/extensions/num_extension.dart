import "package:intl/intl.dart";

/// A set of useful extensions for the [num] class.
extension NumExtension on num {
  /// Returns a double with two decimal places.
  double get twoDecimalsDouble => double.parse(toStringAsFixed(2));

  /// Converts a number to a currency string
  /// Example: 1000.0.toCurrencyString() -> $ 1,000.00
  String toCurrencyString({
    String symbol = r"$ ",
    int decimalDigits = 2,
  }) {
    final formatter = NumberFormat.currency(
      locale: "es_MX",
      symbol: symbol,
      decimalDigits: decimalDigits,
    );

    final String textFormated = formatter.format(this);

    return textFormated;
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
