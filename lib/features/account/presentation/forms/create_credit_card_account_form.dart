part of 'create_account_form.dart';

/// Form to create a credit card account
///
/// This form is children of [CreateAccountForm] and is not meant to be used
/// independently.
class _CreateCreditCardAccountForm extends StatefulWidget {
  /// Form to create a credit card account
  const _CreateCreditCardAccountForm({
    required this.formEntity,
  });

  /// Form entity that contains the form data
  final CreateAccountFormEntity formEntity;

  @override
  State<_CreateCreditCardAccountForm> createState() =>
      __CreateCreditCardAccountFormState();
}

class __CreateCreditCardAccountFormState
    extends State<_CreateCreditCardAccountForm> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Divider(
            height: 60,
          ),
          FormBuilderAmountField(
            name: "credit_limit",
            label: AppLocalizations.current.creditCardAmountLimit,
          ),
          AppSeparators.vMedium,
          FormBuilderAmountField(
            name: "interest_rate",
            label: "Tasa de interés",
          ),
          AppSeparators.vMedium,
          FormBuilderDateTimePicker(
            name: "date_statement",
            decoration: const InputDecoration(
              labelText: "Fecha de corte",
              suffixIcon: Icon(
                Icons.calendar_today,
                size: 20,
              ),
            ),
          ),
          AppSeparators.vMedium,
          FormBuilderDateTimePicker(
            name: "date_payment",
            decoration: const InputDecoration(
              labelText: "Fecha de pago",
              suffixIcon: Icon(
                Icons.calendar_today,
                size: 20,
              ),
            ),
          ),
        ],
      );
}
