import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:form_builder_dropdown_search/form_builder_dropdown_search.dart";
import "package:get_it/get_it.dart";

import "../../../../../core/constants/theme/material_theme.dart";
import "../../../../../core/extensions/string_extension.dart";
import "../../../../../core/extensions/theme_extension.dart";
import "../../../../../core/localization/l10n.dart";
import "../../../../shared/presentation/widgets/form_fields/form_builder_dropdown_search/form_builder_dropdown_search_field.dart";
import "../../../../shared/shared.dart";
import "../../../business/use_cases/get_all_currencies_use_case.dart";
import "../../../internationalization.dart";

/// Form field to select a sub concept via a bottom sheet
///
/// This field is used to select a sub concept from a list of sub concepts
/// via a bottom sheet.
class FormBuilderCurrencyBottomSheetField extends StatelessWidget {
  /// Form field to select a sub concept via a bottom sheet
  const FormBuilderCurrencyBottomSheetField({
    required this.name,
    this.onChanged,
    this.bottomSheetKey,
    super.key,
  });

  /// Name of the field in the form.
  final String name;

  /// Callback when the value is changed.
  final ValueChanged<CurrencyEntity?>? onChanged;

  /// Key to access the bottom sheet.
  final GlobalKey<FormBuilderDropdownSearchState<CurrencyEntity>>?
      bottomSheetKey;

  @override
  Widget build(BuildContext context) =>
      FormBuilderDropdownSearchField<CurrencyEntity>(
        name: name,
        label: AppLocalizations.current.currencySelect.toCapitalized(),
        bottomSheetKey: bottomSheetKey,
        title: Text(
          AppLocalizations.current.currencySelect.toCapitalized(),
          style: context.textTheme.titleMedium,
        ),
        onChanged: onChanged,
        itemAsString: (item) => item.name,
        filterFn: (currency, filter) => currency.lookup(filter),
        compareFn: (item1, item2) => item1.code == item2.code,
        useCase: () => GetAllCurrenciesUseCase(
          repository: GetIt.I.get<InternationalizationRepository>(),
        ).call(
          params: const NoParams(),
        ),
        itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
          title: Text(item.name),
          subtitle: Text(item.code),
          leading: const SizedBox(
            width: 50,
            child: Icon(FontAwesomeIcons.solidCircleDollar),
          ),
          trailing: _getTrailingIcon(isSelected),
        ),
      );

  Widget _getTrailingIcon(bool isSelected) => isSelected
      ? FaIcon(
          FontAwesomeIcons.solidCircleCheck,
          color: MaterialTheme.green.value,
        )
      : const SizedBox.shrink();
}
