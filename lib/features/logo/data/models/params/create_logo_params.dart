import '../../../../../core/constants/classes/params.dart';
import '../../../business/entities/forms/create_logo_form_entity.dart';

/// Parameters to create a new logo
class CreateLogoParams extends Params {
  /// Parameters to create a new logo
  CreateLogoParams({
    required this.form,
    required this.path,
  });

  /// Form to create a new logo
  final CreateLogoFormEntity form;

  /// Path where the image is stored
  final String path;

  @override
  Map<String, dynamic> toMap() => {
        'name': form.nameInput.value,
        'domain': form.domainInput.value,
        'category': form.categoryInput.value,
        'style': form.styleInput.value,
        'path': path,
      };
}
