import "package:equatable/equatable.dart";

import "enums/logo_category_enum.dart";

/// Entity that contains the data of a logo image.
class LogoEntity extends Equatable {
  /// Entity that contains the data of a logo image.
  const LogoEntity({
    required this.name,
    required this.domain,
    required this.category,
    this.path,
  });

  /// Name of the logo
  final String name;

  /// Domain of the logo
  final String domain;

  /// Local path of the logo
  final String? path;

  /// Category of the logo
  final LogoCategoryEnum category;

  @override
  List<Object?> get props => [
        name,
        domain,
        path,
        category,
      ];

  @override
  bool get stringify => true;
}
