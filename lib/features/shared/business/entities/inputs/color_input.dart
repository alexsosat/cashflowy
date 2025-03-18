import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_z/models/input_entity.dart';

/// Input field for providing a [Color] class to a form
class ColorInput extends InputEntity<Color?> {
  /// Provides a clean value for the input
  const ColorInput.pure({
    required super.field,
    this.isRequired = true,
  }) : super.pure(value: null);

  /// Provides a dirty value for the input
  const ColorInput.dirty({
    required super.field,
    required super.value,
    this.isRequired = true,
  }) : super.dirty();

  /// True if the input is required
  final bool isRequired;

  // Override validator to handle validating a given input value.
  @override
  String? validator(Color? value) => FormBuilderValidators.compose<Color>(
        [
          if (isRequired) FormBuilderValidators.required(),
        ],
      ).call(value);

  @override
  ColorInput dirty({
    Color? value,
    bool? isRequired,
  }) =>
      ColorInput.dirty(
        field: field,
        value: value,
        isRequired: isRequired ?? this.isRequired,
      );
}
