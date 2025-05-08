import "package:dropdown_search/dropdown_search.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:form_builder_dropdown_search/form_builder_dropdown_search.dart";

import "../../../../../core/constants/theme/material_theme.dart";
import "../../../../../core/extensions/string_extension.dart";
import "../../../../../core/extensions/theme_extension.dart";
import "../../../../../core/localization/l10n.dart";
import "../../../business/entities/enums/bank_card_type_enum.dart";

/// Form field to select a card type via a bottom sheet
///
/// This field is used to select a card type from a list of card types
/// via a bottom sheet.
class FormBuilderCardTypeBottomSheetField extends StatelessWidget {
  /// Form field to select a card type via a bottom sheet
  const FormBuilderCardTypeBottomSheetField({
    required this.name,
    this.onChanged,
    this.bottomSheetKey,
    super.key,
  });

  /// Name of the field in the form.
  final String name;

  /// Callback when the value is changed.
  final ValueChanged<BankCardTypeEnum?>? onChanged;

  /// Key to access the bottom sheet.
  final GlobalKey<FormBuilderDropdownSearchState<BankCardTypeEnum>>?
      bottomSheetKey;

  @override
  Widget build(BuildContext context) =>
      FormBuilderDropdownSearch<BankCardTypeEnum>(
        key: bottomSheetKey,
        name: name,
        items: (_, __) => BankCardTypeEnum.values,
        popupProps: PopupProps.modalBottomSheet(
          title: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              AppLocalizations.current.bankCardTypeSelect.toCapitalized(),
              style: context.textTheme.titleMedium,
            ),
          ),
          itemBuilder: (context, item, isDisabled, isSelected) => ListTile(
            title: Text(item.name),
            subtitle: Text(item.name),
            leading: const SizedBox(
              width: 50,
              child: Icon(FontAwesomeIcons.solidCircleDollar),
            ),
            trailing: _getTrailingIcon(isSelected),
          ),
          loadingBuilder: (context, searchEntry) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          cacheItems: true,
          showSearchBox: false,
          searchDelay: Duration.zero,
          showSelectedItems: true,
          modalBottomSheetProps: const ModalBottomSheetProps(
            useRootNavigator: true,
          ),
        ),
        decoration: InputDecoration(
          labelText:
              AppLocalizations.current.bankCardTypeSelect.toCapitalized(),
        ),
        onChanged: onChanged,
        itemAsString: (item) => item.name,
        compareFn: (item1, item2) => item1 == item2,
        clearButtonProps: ClearButtonProps(
          isVisible: true,
          icon: FaIcon(
            FontAwesomeIcons.trash,
            color: context.colorScheme.outlineVariant,
          ),
        ),
      );

  Widget _getTrailingIcon(bool isSelected) => isSelected
      ? FaIcon(
          FontAwesomeIcons.solidCircleCheck,
          color: MaterialTheme.green.value,
        )
      : const SizedBox.shrink();
}
