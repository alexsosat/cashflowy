import "package:flutter/widgets.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:form_builder_z/models/input_entity.dart";

/// Input for providing a color input field
class ColorInput extends InputEntity<Color?> {
  /// Input for providing a color input field
  const ColorInput.pure({
    required super.field,
  }) : super.pure(value: null);

  const ColorInput.dirty({
    required super.field,
    required super.value,
    required super.validators,
  }) : super.dirty();

  @override
  ColorInput dirty({
    required List<TranslatedValidator<Color?>> validators,
    Color? value,
  }) =>
      ColorInput.dirty(
        field: field,
        value: value,
        validators: validators,
      );
}
