part of 'create_account_form.dart';

/// Form to create a card account
///
/// This form is children of [CreateAccountForm] and is not meant to be used
/// independently.
class _CreateCardAccountForm extends StatefulWidget {
  /// Form to create a card account
  const _CreateCardAccountForm({
    required this.formEntity,
  });

  /// Form entity that contains the form data
  final CreateAccountFormEntity formEntity;

  @override
  State<_CreateCardAccountForm> createState() => _CreateCardAccountFormState();
}

class _CreateCardAccountFormState extends State<_CreateCardAccountForm> {
  late GlobalKey<FormBuilderDropdownSearchState<BankCardTypeEnum>>
      _cardTypeBottomSheetKey;

  late bool _showCreditCardAccountForm;

  @override
  void initState() {
    _cardTypeBottomSheetKey =
        GlobalKey<FormBuilderDropdownSearchState<BankCardTypeEnum>>();

    _showCreditCardAccountForm = false;
    super.initState();
  }

  @override
  void dispose() {
    _cardTypeBottomSheetKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Divider(
            height: 60,
          ),
          FormBuilderTextField(
            autofocus: true,
            name: widget.formEntity.cardNumberInput.field,
            keyboardType: TextInputType.number,
            maxLines: 1,
            decoration: const InputDecoration(
              labelText: 'No. de tarjeta',
            ),
            inputFormatters: [
              CreditCardFormatter(
                mask: 'xxxx-xxxx-xxxx-xxxx',
                separator: '-',
              ),
            ],
            onTapOutside: (_) => hideKeyboard(),
            onSubmitted: _onCardNumberSubmit,
          ),
          AppSeparators.vMedium,
          FormBuilderCardTypeBottomSheetField(
            bottomSheetKey: _cardTypeBottomSheetKey,
            name: widget.formEntity.cardTypeInput.field,
            onChanged: _onCardTypeChanged,
          ),
          Visibility(
            visible: _showCreditCardAccountForm,
            child: _CreateCreditCardAccountForm(
              formEntity: widget.formEntity,
            ),
          ),
        ],
      );

  void _onCardNumberSubmit(String? value) =>
      _cardTypeBottomSheetKey.currentState?.openDropDownSearch();

  void _onCardTypeChanged(BankCardTypeEnum? value) {
    if (value == null) return;
    setState(
      () => _showCreditCardAccountForm = value == BankCardTypeEnum.CREDIT,
    );
  }
}
