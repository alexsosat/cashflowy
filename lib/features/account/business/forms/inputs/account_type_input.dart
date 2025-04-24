import "package:form_builder_validators/form_builder_validators.dart";
import "package:form_builder_z/models/input_entity.dart";

import "../../entities/enums/account_type_enum.dart";

/// Input for providing an account type input field
class AccountTypeInput extends InputEntity<AccountTypeEnum?> {
  /// Input for providing an account type input field
  const AccountTypeInput.pure({
    required super.field,
    required super.validators,
  }) : super.pure(value: null);

  const AccountTypeInput.dirty({
    required super.field,
    required super.value,
    required super.validators,
  }) : super.dirty();

  @override
  AccountTypeInput dirty({
    AccountTypeEnum? value,
    List<TranslatedValidator<AccountTypeEnum>>? validators,
  }) =>
      AccountTypeInput.dirty(
        field: field,
        value: value,
        validators: validators ?? this.validators,
      );
}
