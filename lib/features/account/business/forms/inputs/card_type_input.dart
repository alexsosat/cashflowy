import "package:form_builder_validators/form_builder_validators.dart";
import "package:form_builder_z/models/input_entity.dart";

import "../../entities/enums/bank_card_type_enum.dart";

/// Input for providing an account type input field
class CardTypeInput extends InputEntity<BankCardTypeEnum?> {
  /// Input for providing an account type input field
  const CardTypeInput.pure({
    required super.field,
    super.validators,
  }) : super.pure(value: null);

  const CardTypeInput.dirty({
    required super.field,
    required super.value,
    required super.validators,
  }) : super.dirty();

  @override
  CardTypeInput dirty({
    BankCardTypeEnum? value,
    List<TranslatedValidator<BankCardTypeEnum?>>? validators,
  }) =>
      CardTypeInput.dirty(
        field: field,
        value: value,
        validators: validators ?? this.validators,
      );
}
