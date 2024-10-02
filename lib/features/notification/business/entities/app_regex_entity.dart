import 'package:equatable/equatable.dart';

/// Entity that contains the AppRegex values.
class AppRegexEntity extends Equatable {
  /// Entity that contains the AppRegex values.
  const AppRegexEntity({
    required this.id,
    required this.isPurchase,
    required this.regex,
  });

  /// Unique identifier for the regex
  final int id;

  /// True if the regex is used for purchases
  /// False if the regex is used for incomes
  final bool isPurchase;

  /// Regex to get the values of the notifications belonging to the app
  final String regex;

  @override
  List<Object?> get props => [
        id,
        isPurchase,
        regex,
      ];

  @override
  bool get stringify => true;
}
