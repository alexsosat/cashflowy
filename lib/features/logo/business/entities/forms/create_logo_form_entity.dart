import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_z/inputs/string_input.dart';
import 'package:form_builder_z/models/form_entity.dart';
import 'package:form_builder_z/models/input_entity.dart';

import '../enums/enums.dart';
import 'inputs/inputs.dart';

/// Form inputs to create a logo
class CreateLogoFormEntity extends FormEntity {
  /// Form inputs to create a logo
  const CreateLogoFormEntity({
    this.nameInput = const StringInput.pure(
      field: "name",
      validators: [
        RequiredValidator(),
        MaxLengthValidator(50),
      ],
    ),
    this.domainInput = const StringInput.pure(
      field: "domain",
      validators: [
        RequiredValidator(),
        MaxLengthValidator(256),
      ],
    ),
    this.categoryInput = const LogoCategoryInput.pure(
      field: "category",
    ),
    this.styleInput = const LogoStyleInput.pure(
      field: "style",
    ),
  });

  /// Input for the name of the logo
  final StringInput nameInput;

  /// Input for the image of the logo
  final StringInput domainInput;

  /// Input for the category of the logo
  final LogoCategoryInput categoryInput;

  /// Input for the style of the logo
  final LogoStyleInput styleInput;

  @override
  // TODO: implement inputs
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
    );

    domainInput = domainInput.dirty(
      value: fields[domainInput.field] as String?,
    );

    categoryInput = categoryInput.dirty(
      value: fields[categoryInput.field] as LogoCategoryEnum?,
    );

    styleInput = styleInput.dirty(
      value: fields[styleInput.field] as LogoStyleEnum?,
    );
  }
}
