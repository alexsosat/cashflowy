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
  late GlobalKey<FormBuilderAmountFieldState> creditLimitKey;
  late GlobalKey<FormBuilderAmountFieldState> interestRateKey;

  late FocusNode statementDateFocus;
  late FocusNode paymentDateFocus;

  @override
  void initState() {
    creditLimitKey = GlobalKey<FormBuilderAmountFieldState>();
    interestRateKey = GlobalKey<FormBuilderAmountFieldState>();
    statementDateFocus = FocusNode();
    paymentDateFocus = FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      creditLimitKey.currentState?.openCalculator();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const Divider(
            height: 60,
          ),
          FormBuilderAmountField(
            key: creditLimitKey,
            name: widget.formEntity.creditLimitInput.field,
            label: AppLocalizations.current.creditCardAmountLimit,
            onChanged: _onCreditLimitChanged,
          ),
          AppSeparators.vMedium,
          FormBuilderAmountField(
            key: interestRateKey,
            name: widget.formEntity.interestRateInput.field,
            label: AppLocalizations.current.interestRate,
            symbol: "%",
            onChanged: _onInterestRateChanged,
          ),
          AppSeparators.vMedium,
          FormBuilderDateTimePicker(
            focusNode: statementDateFocus,
            name: widget.formEntity.statementDateInput.field,
            inputType: InputType.date,
            format: DateFormat.yMMMMd(),
            decoration: InputDecoration(
              labelText: AppLocalizations.current.statementDate,
              suffixIcon: const Icon(
                Icons.calendar_today,
                size: 20,
              ),
            ),
            onChanged: _onStatementDateChanged,
          ),
          AppSeparators.vMedium,
          FormBuilderDateTimePicker(
            name: widget.formEntity.paymentDateInput.field,
            focusNode: paymentDateFocus,
            inputType: InputType.date,
            format: DateFormat.yMMMMd(),
            decoration: InputDecoration(
              labelText: AppLocalizations.current.paymentDate,
              suffixIcon: const Icon(
                Icons.calendar_today,
                size: 20,
              ),
            ),
          ),
        ],
      );

  /// Callback when the credit limit is changed
  void _onCreditLimitChanged(double? value) {
    if (value == null) return;

    interestRateKey.currentState?.openCalculator();
  }

  /// Callback when the interest rate is changed
  void _onInterestRateChanged(double? value) {
    if (value == null) return;

    statementDateFocus.requestFocus();
  }

  /// Callback when the statement date is changed
  void _onStatementDateChanged(DateTime? value) {
    if (value == null) return;

    // TODO: Make it to not request focus on canceled
    paymentDateFocus.requestFocus();
  }
}
