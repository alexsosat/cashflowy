import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_z/inputs/string_input.dart';
import 'package:form_builder_z/models/form_entity.dart';
import 'package:form_builder_z/models/input_entity.dart';

import '../enums/enums.dart';
import 'inputs/inputs.dart';

/// Form inputs to create a logo
class CreateLogoFormEntity extends FormEntity {
  /// Form inputs to create a logo
  CreateLogoFormEntity({
    this.nameInput = const StringInput.pure(
      field: "name",
    ),
    this.domainInput = const StringInput.pure(
      field: "domain",
    ),
    this.categoryInput = const LogoCategoryInput.pure(
      field: "category",
    ),
    this.styleInput = const LogoStyleInput.pure(
      field: "style",
    ),
    super.formKey,
  });

  /// Input for the name of the logo
  StringInput nameInput;

  /// Input for the image of the logo
  StringInput domainInput;

  /// Input for the category of the logo
  LogoCategoryInput categoryInput;

  /// Input for the style of the logo
  LogoStyleInput styleInput;

  @override
  List<InputEntity> get inputs => [
        nameInput,
        domainInput,
        categoryInput,
        styleInput,
      ];

  @override
  void save(Map<String, dynamic> fields) {
    nameInput = nameInput.dirty(
      value: fields[nameInput.field] as String?,
      validators: [
        const RequiredValidator(),
        const MaxLengthValidator(50),
      ],
    );

    domainInput = domainInput.dirty(
      value: fields[domainInput.field] as String?,
      validators: [
        const RequiredValidator(),
        const MaxLengthValidator(256),
      ],
    );

    categoryInput = categoryInput.dirty(
      value: fields[categoryInput.field] as LogoCategoryEnum?,
      validators: [
        const RequiredValidator(),
      ],
    );

    styleInput = styleInput.dirty(
      value: fields[styleInput.field] as LogoStyleEnum?,
    );
  }
}
