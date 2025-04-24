import 'package:equatable/equatable.dart';

/// Entity that contains the Currency values.
class CurrencyEntity extends Equatable {
  /// Entity that contains the Currency values.
  const CurrencyEntity({
    required this.name,
    required this.code,
  });

  /// Full name of the currency.
  final String name;

  /// Code of the currency.
  final String code;

  /// True if the query is present in the name or code.
  bool lookup(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return name.toLowerCase().contains(lowerCaseQuery) ||
        code.toLowerCase().contains(lowerCaseQuery);
  }

  @override
  List<Object?> get props => [
        name,
        code,
      ];

  @override
  bool get stringify => true;
}
