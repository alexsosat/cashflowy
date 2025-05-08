// ignore_for_file: public_member_api_docs

import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_z/models/input_entity.dart';

import '../../enums/logo_style_enum.dart';

/// Input for the style of the logo
class LogoStyleInput extends InputEntity<LogoStyleEnum?> {
  const LogoStyleInput.pure({
    required super.field,
    super.validators,
  }) : super.pure(value: null);

  const LogoStyleInput.dirty({
    required super.field,
    required super.value,
    super.validators = const [],
  }) : super.dirty();

  @override
  LogoStyleInput dirty({
    LogoStyleEnum? value,
    List<TranslatedValidator<LogoStyleEnum?>>? validators,
  }) =>
      LogoStyleInput.dirty(
        field: field,
        value: value ?? this.value,
        validators: validators ?? this.validators,
      );

  @override
  String? validator(LogoStyleEnum? value) {
    validators.add(const RequiredValidator());

    return super.validator(value);
  }
}
