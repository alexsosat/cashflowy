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
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Divider(
            height: 60,
          ),
          FormBuilderTextField(
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
          ),
          AppSeparators.vMedium,
          FormBuilderCardTypeBottomSheetField(
            name: widget.formEntity.cardNumberInput.field,
          ),
          _CreateCreditCardAccountForm(
            formEntity: widget.formEntity,
          ),
        ],
      );
}
