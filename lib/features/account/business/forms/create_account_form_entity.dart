import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:form_builder_z/inputs/date_time_input.dart';
import 'package:form_builder_z/inputs/double_input.dart';
import 'package:form_builder_z/inputs/string_input.dart';
import 'package:form_builder_z/models/form_entity.dart';
import 'package:form_builder_z/models/input_entity.dart';

import '../../../internationalization/business/forms/inputs/currency_entity_input.dart';
import '../../../shared/business/forms/inputs/color_input.dart';
import '../../../shared/business/forms/validators/validators.dart'
    as custom_validators;
import '../entities/enums/account_type_enum.dart';
import '../entities/enums/bank_card_type_enum.dart';
import 'inputs/account_type_input.dart';
import 'inputs/card_type_input.dart';

/// Form inputs to create an account
class CreateAccountFormEntity extends FormEntity {
  /// Form inputs to create an account
  CreateAccountFormEntity({
    this.nameInput = const StringInput.pure(
      field: "name",
    ),
    this.colorInput = const ColorInput.pure(
      field: "color",
    ),
    this.currencyInput = const CurrencyEntityInput.pure(
      field: "currency",
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
    ),
    this.cardTypeInput = const CardTypeInput.pure(
      field: "card_type",
    ),
    this.creditLimitInput = const DoubleInput.pure(
      field: "credit_limit",
    ),
    this.interestRateInput = const DoubleInput.pure(
      field: "interest_rate",
    ),
    this.statementDateInput = const DateTimeInput.pure(
      field: "statement_date",
    ),
    this.paymentDateInput = const DateTimeInput.pure(
      field: "payment_date",
    ),
    super.formKey,
  });

  /// Input for the name of the account
  StringInput nameInput;

  /// Color of the account
  ColorInput colorInput;

  /// Currency of the account
  CurrencyEntityInput currencyInput;

  /// Type of the account
  AccountTypeInput typeInput;

  /// Card number input
  StringInput cardNumberInput;

  /// Card type input
  CardTypeInput cardTypeInput;

  /// Credit limit input
  DoubleInput creditLimitInput;

  /// Interest rate input
  DoubleInput interestRateInput;

  /// Statement date input
  DateTimeInput statementDateInput;

  /// Payment date input
  DateTimeInput paymentDateInput;

  @override
  List<InputEntity> get inputs => [
        nameInput,
        colorInput,
        currencyInput,
        typeInput,
        cardNumberInput,
        cardTypeInput,
        creditLimitInput,
        interestRateInput,
        statementDateInput,
        paymentDateInput,
      ];

  @override
  void save(Map<String, dynamic> fields) {
    nameInput = nameInput.dirty(
      value: fields[nameInput.field],
      validators: [
        const RequiredValidator(),
      ],
    );

    colorInput = colorInput.dirty(
      value: fields[colorInput.field],
      validators: [
        const RequiredValidator(),
      ],
    );

    currencyInput = currencyInput.dirty(
      value: fields[currencyInput.field],
      validators: [
        const RequiredValidator(),
        const MaxLengthValidator(8),
      ],
    );

    typeInput = typeInput.dirty(
      value: fields[typeInput.field],
      validators: [
        const RequiredValidator(),
      ],
    );

    switch (typeInput.value) {
      case AccountTypeEnum.CARD:
        _saveCardValues(fields);

      case null:
      case AccountTypeEnum.CASH:
      case AccountTypeEnum.INVESTMENT:
        _removeCardValues();
    }
  }

  void _saveCardValues(Map<String, dynamic> fields) {
    cardNumberInput = cardNumberInput.dirty(
      value:
          (fields[cardNumberInput.field] as String? ?? "").replaceAll("-", ""),
      validators: const [
        custom_validators.CreditCardValidator(
          checkNullOrEmpty: false,
        ),
      ],
    );

    cardTypeInput = cardTypeInput.dirty(
      value: fields[cardTypeInput.field],
      validators: const [
        RequiredValidator(),
      ],
    );

    switch (cardTypeInput.value) {
      case BankCardTypeEnum.CREDIT:
        _saveCreditCardValues(fields);
      case null:
      case BankCardTypeEnum.DEBIT:
        _removeCreditCardValues();
    }
  }

  void _saveCreditCardValues(Map<String, dynamic> fields) {
    creditLimitInput = creditLimitInput.dirty(
      value: fields[creditLimitInput.field],
      validators: const [
        RequiredValidator(),
        MinValidator(0, inclusive: false),
      ],
    );

    interestRateInput = interestRateInput.dirty(
      value: fields[interestRateInput.field],
      validators: const [
        RequiredValidator(),
        MinValidator(1),
      ],
    );

    statementDateInput = statementDateInput.dirty(
      value: fields[statementDateInput.field],
      validators: const [
        RequiredValidator(),
      ],
    );

    paymentDateInput = paymentDateInput.dirty(
      value: fields[paymentDateInput.field],
      validators: const [
        RequiredValidator(),
      ],
    );
  }

  void _removeCardValues() {
    cardNumberInput = const StringInput.pure(
      field: "card_number",
    );

    const CardTypeInput.pure(
      field: "card_type",
    );
    _removeCreditCardValues();
  }

  void _removeCreditCardValues() {
    creditLimitInput = const DoubleInput.pure(
      field: "credit_limit",
    );

    interestRateInput = const DoubleInput.pure(
      field: "interest_rate",
    );
    statementDateInput = const DateTimeInput.pure(
      field: "statement_date",
    );
    paymentDateInput = const DateTimeInput.pure(
      field: "payment_date",
    );
  }
}
