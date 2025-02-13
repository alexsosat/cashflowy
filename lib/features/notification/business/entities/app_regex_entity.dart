import 'package:equatable/equatable.dart';

/// Entity that contains the AppRegex values.
class AppRegexEntity extends Equatable {
  /// Entity that contains the AppRegex values.
  const AppRegexEntity({
    required this.id,
    required this.isPurchase,
  });

  /// Unique identifier for the regex
  final int id;

  /// True if the regex is used for purchases
  /// False if the regex is used for incomes
  final bool isPurchase;

  @override
  List<Object?> get props => [
        id,
        isPurchase,
      ];

  @override
  bool get stringify => true;
}
