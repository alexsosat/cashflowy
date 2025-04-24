// ignore_for_file: public_member_api_docs

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_z/models/input_entity.dart';

import '../../enums/logo_category_enum.dart';

/// Input for the category of the logo
class LogoCategoryInput extends InputEntity<LogoCategoryEnum?> {
  const LogoCategoryInput.pure({
    required super.field,
    super.validators,
  }) : super.pure(value: null);

  const LogoCategoryInput.dirty({
    required super.field,
    required super.value,
    super.validators,
  }) : super.dirty();

  @override
  LogoCategoryInput dirty({
    LogoCategoryEnum? value,
    List<TranslatedValidator<LogoCategoryEnum>>? validators,
  }) =>
      LogoCategoryInput.dirty(
        field: field,
        value: value ?? this.value,
        validators: validators ?? this.validators,
      );

  @override
  String? validator(LogoCategoryEnum? value) {
    validators.add(const RequiredValidator());

    return super.validator(value);
  }
}
