import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_z/inputs/string_input.dart';
import 'package:form_builder_z/models/form_entity.dart';
import 'package:form_builder_z/models/input_entity.dart';

import '../../../shared/business/forms/validators/validators.dart'
    as custom_validators;
import '../entities/enums/account_type_enum.dart';
import 'inputs/account_type_input.dart';

/// Form inputs to create an account
class CreateAccountFormEntity extends FormEntity {
  /// Form inputs to create an account
  CreateAccountFormEntity({
    this.nameInput = const StringInput.pure(
      field: "name",
      validators: [
        RequiredValidator(),
      ],
    ),
    this.colorInput = const StringInput.pure(
      field: "color",
      validators: [
        RequiredValidator(),
        custom_validators.ColorCodeValidator(formats: ["hex"]),
      ],
    ),
    this.currencyInput = const StringInput.pure(
      field: "currency",
      validators: [
        RequiredValidator(),
        MaxLengthValidator(8),
      ],
    ),
    this.typeInput = const AccountTypeInput.dirty(
      field: "type",
      value: AccountTypeEnum.CASH,
      validators: [
        RequiredValidator(),
      ],
    ),
    this.cardNumberInput = const StringInput.pure(
      field: "card_number",
      validators: [],
    ),
    super.formKey,
  });

  /// Input for the name of the account
  StringInput nameInput;

  /// Color of the account
  StringInput colorInput;

  /// Currency of the account
  StringInput currencyInput;

  /// Type of the account
  AccountTypeInput typeInput;

  /// Card number input
  StringInput cardNumberInput;

  @override
  List<InputEntity> get inputs => [
        nameInput,
        colorInput,
        currencyInput,
        typeInput,
        cardNumberInput,
      ];

  @override
  void save(Map<String, dynamic> fields) {
    nameInput = nameInput.dirty(
      value: fields[nameInput.field],
    );

    colorInput = colorInput.dirty(
      value: fields[colorInput.field],
    );

    currencyInput = currencyInput.dirty(
      value: fields[currencyInput.field],
    );

    typeInput = typeInput.dirty(
      value: fields[typeInput.field],
    );

    if (typeInput.value == AccountTypeEnum.CARD) {
      cardNumberInput = cardNumberInput.dirty(
        value: (fields[cardNumberInput.field] as String? ?? "")
            .replaceAll("-", ""),
        validators: const [
          RequiredValidator(),
          MaxLengthValidator(16),
          custom_validators.CreditCardValidator(),
        ],
      );
    }
  }
}
