import "package:equatable/equatable.dart";

import "enums/logo_category_enum.dart";
import "enums/logo_style_enum.dart";

/// Entity that contains the data of a logo image.
class LogoEntity extends Equatable {
  /// Entity that contains the data of a logo image.
  const LogoEntity({
    required this.id,
    required this.name,
    required this.domain,
    required this.category,
    required this.style,
    this.path,
  });

  /// Unique identifier of the logo
  final int id;

  /// Name of the logo
  final String name;

  /// Domain of the logo
  final String domain;

  /// The style of the logo
  final LogoStyleEnum style;

  /// Local path of the logo
  final String? path;

  /// Category of the logo
  final LogoCategoryEnum category;

  @override
  List<Object?> get props => [
        id,
        name,
        domain,
        style,
        path,
        category,
      ];

  @override
  bool get stringify => true;

  /// True if the logo contains [query] on its name.
  bool lookup(String query) => name.toLowerCase().contains(query.toLowerCase());
}
