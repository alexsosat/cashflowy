import "dart:async";

import "package:dropdown_search/dropdown_search.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:fpdart/fpdart.dart";

import "../../../../../../core/errors/failure.dart";
import "../../../../../../core/extensions/string_extension.dart";
import "../../../../../../core/extensions/theme_extension.dart";
import "../../../../../../core/localization/l10n.dart";
import "../../../content/failure_content.dart";
import "form_builder_dropdown_search.dart";

/// A form field that shows a bottom sheet when clicked
class FormBuilderDropdownSearchField<T> extends StatelessWidget {
  /// A form field that shows a bottom sheet when focused
  const FormBuilderDropdownSearchField({
    required this.name,
    required this.useCase,
    required this.itemBuilder,
    required this.label,
    required this.compareFn,
    required this.itemAsString,
    this.title,
    this.onChanged,
    this.emptyText,
    this.validator,
    this.disabledItemFn,
    this.bottomSheetKey,
    this.filterFn,
    this.errorText,
    this.clearButtonVisible = true,
    this.showSearchBox = true,
    this.enabled = true,
    this.containerBuilder,
    super.key,
  });

  /// Name of the field
  final String name;

  /// Title of the bottom sheet
  final Widget? title;

  /// Function to get the items to be displayed in the bottom sheet
  final Future<Either<Failure, List<T>>> Function() useCase;

  /// True if the search box should be visible
  final bool showSearchBox;

  /// Validator to be applied to the form field
  final String? Function(T?)? validator;

  /// Label to be displayed when no value selected
  final String? label;

  /// Text to be displayed when the items are empty
  final String? emptyText;

  /// True if the clear button should be visible
  final bool clearButtonVisible;

  /// Builder to display the options in the bottom sheet
  final DropdownSearchPopupItemBuilder<T>? itemBuilder;

  /// Defines if an item of the popup is enabled or not, if the item is disabled,
  /// it cannot be clicked
  final DropdownSearchPopupItemEnabled<T>? disabledItemFn;

  /// Function to be called when the value changes
  final ValueChanged<T?>? onChanged;

  /// Function that compares two object with the same type to detected
  /// if it's the selected item or not
  final DropdownSearchCompareFn<T> compareFn;

  /// Customize the fields the be shown
  final DropdownSearchItemAsString<T> itemAsString;

  /// Key to be used for the bottom sheet
  final GlobalKey<DropdownSearchState>? bottomSheetKey;

  ///	Custom filter function
  final DropdownSearchFilterFn<T>? filterFn;

  /// True if the field is enabled
  final bool enabled;

  /// Message to be displayed for programmatic errors
  final String? errorText;

  /// Container builder for the bottom sheet
  final Widget Function(BuildContext context, Widget child)? containerBuilder;

  @override
  Widget build(BuildContext context) => FormBuilderDropdownSearch<T>(
        bottomSheetKey: bottomSheetKey,
        name: name,
        enabled: enabled,
        items: _getItems,
        clearButtonProps: ClearButtonProps(
          isVisible: clearButtonVisible,
          icon: FaIcon(
            FontAwesomeIcons.trash,
            color: context.colorScheme.outlineVariant,
          ),
        ),
        validator: validator,
        popupProps: PopupProps.modalBottomSheet(
          title: title != null
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: title!,
                )
              : null,
          onItemsLoaded: (value) {
            // TODO: Implement onItemsLoaded
          },
          emptyBuilder: _emptyBuilder,
          itemBuilder: itemBuilder,
          loadingBuilder: (context, searchEntry) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          errorBuilder: _errorBuilder,
          disabledItemFn: disabledItemFn,
          cacheItems: true,
          showSearchBox: showSearchBox,
          searchDelay: Duration.zero,
          showSelectedItems: true,
          modalBottomSheetProps: const ModalBottomSheetProps(
            useRootNavigator: true,
          ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              labelText: AppLocalizations.current.search.toCapitalized(),
              prefixIcon: const Icon(
                Icons.search,
              ),
            ),
          ),
          containerBuilder: containerBuilder,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
        ),
        compareFn: compareFn,
        itemAsString: itemAsString,
        filterFn: filterFn,
      );

  FutureOr<List<T>> _getItems(
    String _,
    LoadProps? __,
  ) async {
    final itemsResponse = await useCase();

    return itemsResponse.fold(
      // ignore: only_throw_errors
      (failure) => throw failure,
      (items) => items,
    );
  }

  Widget _emptyBuilder(_, __) => Center(
        child: Text(
          emptyText ?? AppLocalizations.current.noItemsFound.toCapitalized(),
        ),
      );

  Widget _errorBuilder(
    _,
    __,
    exception,
  ) {
    if (exception is Failure) {
      return Center(
        child: FailureContent(
          exception,
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppLocalizations.current.unexpectedError.toCapitalized()),
          Text(exception.toString()),
        ],
      ),
    );
  }
}
