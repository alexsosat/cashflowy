import '../../../../../core/constants/classes/params.dart';
import '../../../../logo/business/entities/enums/enums.dart';

/// Parameters to retrieve the logo directory
class GetLogoDirectoryParams extends Params {
  /// Parameters to retrieve the logo directory
  GetLogoDirectoryParams({
    required this.category,
  });

  /// Category of the logo
  final LogoCategoryEnum category;
}
