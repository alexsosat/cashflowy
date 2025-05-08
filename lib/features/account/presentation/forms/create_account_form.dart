import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_dropdown_search/form_builder_dropdown_search.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/theme/app_separators.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/localization/l10n.dart';
import '../../../internationalization/internationalization.dart';
import '../../../internationalization/presentation/widgets/form_fields/form_builder_currency_bottomsheet_field.dart';
import '../../../shared/business/forms/formatters/credit_card_formatter.dart';
import '../../../shared/presentation/helpers/hide_keyboard.dart';
import '../../../shared/presentation/widgets/form_fields/form_builder_amount_field/form_builder_amount_field.dart';
import '../../../shared/presentation/widgets/form_fields/form_builder_color_picker/form_builder_color_picker_field.dart';
import '../../business/entities/enums/account_type_enum.dart';
import '../../business/entities/enums/bank_card_type_enum.dart';
import '../../business/forms/create_account_form_entity.dart';
import '../widgets/form_fields/form_builder_account_type_bottomsheet_field.dart';
import '../widgets/form_fields/form_builder_card_type_bottomsheet_field.dart';

part 'create_card_account_form.dart';
part 'create_credit_card_account_form.dart';

/// Form to create an account
class CreateAccountForm extends StatefulWidget {
  /// Form to create an account
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  late CreateAccountFormEntity _formEntity;
  late GlobalKey<FormBuilderState> _formKey;

  late GlobalKey<FormBuilderDropdownSearchState<CurrencyEntity>>
      _currencyBottomSheetKey;
  late FocusNode _colorPickerFocusNode;
  late GlobalKey<FormBuilderDropdownSearchState<AccountTypeEnum>>
      _accountTypeBottomSheetKey;

  late bool _showCardAccountForm;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>(debugLabel: "CreateAccountForm");
    _formEntity = CreateAccountFormEntity(
      formKey: _formKey,
    );

    _currencyBottomSheetKey =
        GlobalKey<FormBuilderDropdownSearchState<CurrencyEntity>>();
    _colorPickerFocusNode = FocusNode();
    _accountTypeBottomSheetKey =
        GlobalKey<FormBuilderDropdownSearchState<AccountTypeEnum>>();

    _showCardAccountForm = false;
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _currencyBottomSheetKey.currentState?.dispose();
    _accountTypeBottomSheetKey.currentState?.dispose();
    _colorPickerFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: _formEntity.nameInput.field,
              autofocus: true,
              decoration: InputDecoration(
                labelText: AppLocalizations.current.name.toCapitalized(),
              ),
              onTapOutside: (_) => hideKeyboard(),
              onSubmitted: _onNameSubmit,
            ),
            AppSeparators.vMedium,
            FormBuilderCurrencyBottomSheetField(
              name: _formEntity.currencyInput.field,
              bottomSheetKey: _currencyBottomSheetKey,
              onChanged: _onCurrencyChanged,
            ),
            AppSeparators.vMedium,
            FormBuilderColorPickerField(
              name: _formEntity.colorInput.field,
              focusNode: _colorPickerFocusNode,
              colorPickerType: ColorPickerType.materialPicker,
              decoration: InputDecoration(
                labelText: AppLocalizations.current.colorSelect.toCapitalized(),
              ),
              onChanged: _onColorChanged,
            ),
            AppSeparators.vMedium,
            FormBuilderAccountTypeBottomSheetField(
              name: _formEntity.typeInput.field,
              bottomSheetKey: _accountTypeBottomSheetKey,
              onChanged: _onAccountTypeChanged,
            ),
            Visibility(
              visible: _showCardAccountForm,
              child: _CreateCardAccountForm(
                formEntity: _formEntity,
              ),
            ),
            AppSeparators.vLarge,
            FilledButton(
              onPressed: _onFormSubmit,
              child: Text("Submit"),
            ),
          ],
        ),
      );

  void _onNameSubmit(String? value) {
    final state = _currencyBottomSheetKey.currentState;

    print(state);

    _currencyBottomSheetKey.currentState?.openDropDownSearch();
  }

  void _onCurrencyChanged(CurrencyEntity? value) {
    if (value == null) return;

    _colorPickerFocusNode.requestFocus();
  }

  void _onColorChanged(Color? value) {
    if (value == null) return;

    print("Color selected: ${_accountTypeBottomSheetKey.currentState}");

    _accountTypeBottomSheetKey.currentState?.openDropDownSearch();
  }

  void _onAccountTypeChanged(AccountTypeEnum? value) {
    if (value == null) return;

    setState(() => _showCardAccountForm = value == AccountTypeEnum.CARD);
  }

  void _onFormSubmit() {
    if (!_formEntity.saveAndValidate()) {
      print("Form is not valid: ${_formEntity.errorList}");
      return;
    }

    print("Form is valid: ${_formEntity.values}");
  }
}
