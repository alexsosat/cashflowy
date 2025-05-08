import "package:form_builder_validators/form_builder_validators.dart";
import "package:form_builder_z/models/input_entity.dart";

import "../../entities/currency_entity.dart";

/// Input for providing a currency input field
class CurrencyEntityInput extends InputEntity<CurrencyEntity?> {
  /// Input for providing a currency input field
  const CurrencyEntityInput.pure({
    required super.field,
  }) : super.pure(value: null);

  const CurrencyEntityInput.dirty({
    required super.field,
    required super.value,
    required super.validators,
  }) : super.dirty();

  @override
  CurrencyEntityInput dirty({
    required List<TranslatedValidator<CurrencyEntity?>> validators,
    CurrencyEntity? value,
  }) =>
      CurrencyEntityInput.dirty(
        field: field,
        value: value,
        validators: validators,
      );
}
