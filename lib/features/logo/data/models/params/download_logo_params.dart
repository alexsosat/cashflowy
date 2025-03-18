import 'dart:io';

import '../../../../../core/constants/classes/params.dart';
import '../../../business/entities/enums/enums.dart';

/// Parameters to download a logo
class DownloadLogoParams extends Params {
  /// Parameters to download a logo
  DownloadLogoParams({
    required this.domain,
    required this.category,
  });

  /// Url to download the logo
  final String domain;

  /// Category of the logo
  final LogoCategoryEnum category;

  /// Path to save the downloaded logo
  Directory? directory;
}
