import 'package:drift/drift.dart';

import '../../../../../core/constants/classes/mock_data.dart';
import '../../../../../core/constants/classes/params.dart';
import '../../../business/entities/enums/enums.dart';
import '../../../business/entities/forms/create_logo_form_entity.dart';

/// Parameters to create a new logo
class CreateLogoParams extends Params<LogoTableCompanion> {
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
  LogoTableCompanion toCompanion() => LogoTableCompanion(
        name: Value(form.nameInput.value ?? ""),
        domain: Value(form.domainInput.value ?? ""),
        category: Value(form.categoryInput.value ?? LogoCategoryEnum.MERCHANT),
        style: Value(form.styleInput.value ?? LogoStyleEnum.ICON),
        path: Value(path),
      );
}
