import "package:dropdown_search/dropdown_search.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get_it/get_it.dart";

import "../../../../../core/constants/theme/material_theme.dart";
import "../../../../../core/extensions/string_extension.dart";
import "../../../../../core/extensions/theme_extension.dart";
import "../../../../../core/localization/l10n.dart";
import "../../../../shared/presentation/cubits/bottomsheet_scroll_cubit.dart";
import "../../../../shared/presentation/widgets/form_fields/form_builder_dropdown_search/form_builder_dropdown_search_field.dart";
import "../../../../shared/shared.dart";
import "../../../business/entities/logo_entity.dart";
import "../../../business/repositories/logo_repository.dart";
import "../../../business/use_cases/get_all_logos_use_case.dart";
import "../../forms/create_logo_form.dart";

/// Form field to select a city via a bottom sheet
///
/// This field is used to select a city from a list of cities
/// via a bottom sheet.
class FormBuilderLogoSearchableField extends StatelessWidget {
  /// Form field to select a city via a bottom sheet
  const FormBuilderLogoSearchableField({
    required this.name,
    this.onChanged,
    this.bottomSheetKey,
    super.key,
  });

  /// Name of the field in the form.
  final String name;

  /// Callback when the value is changed.
  final ValueChanged<LogoEntity?>? onChanged;

  /// Key to access the bottom sheet.
  final GlobalKey<DropdownSearchState<LogoEntity>>? bottomSheetKey;

  @override
  Widget build(BuildContext context) =>
      FormBuilderDropdownSearchField<LogoEntity>(
        name: name,
        label: AppLocalizations.current.logoSelect.toCapitalized(),
        bottomSheetKey: bottomSheetKey,
        title: const _FormBuilderLogoHeader(),
        onChanged: onChanged,
        itemAsString: (item) => item.name,
        filterFn: (logo, filter) => logo.lookup(filter),
        compareFn: (item1, item2) => item1.id == item2.id,

        /// TODO: Change for a category filtered usecase
        useCase: () => GetAllLogosUseCase(
          logoRepository: GetIt.I.get<LogoRepository>(),
        ).call(
          params: const NoParams(),
        ),
        itemBuilder: (context, item, isDisabled, isSelected) =>
            _LogoSearchableItem(
          logo: item,
          isDisabled: isDisabled,
          isSelected: isSelected,
        ),
        containerBuilder: (context, child) => BlocProvider(
          create: (context) => BottomSheetScrollCubit(),
          child: _LogoBottomSheet(
            child: child,
          ),
        ),
      );
}

class _FormBuilderLogoHeader extends StatelessWidget {
  const _FormBuilderLogoHeader();

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Text(
              AppLocalizations.current.logoSelect.toCapitalized(),
              style: context.textTheme.titleMedium,
            ),
          ),
          IconButton(
            onPressed: () => _onCreate(context),
            icon: FaIcon(
              FontAwesomeIcons.plus,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      );

  void _onCreate(BuildContext context) {
    context.read<BottomSheetScrollCubit>().moveTo(1);
  }
}

class _LogoSearchableItem extends StatelessWidget {
  const _LogoSearchableItem({
    required this.logo,
    required this.isDisabled,
    required this.isSelected,
  });

  /// Information about the logo
  final LogoEntity logo;

  /// True if the item is disabled by the filter
  final bool isDisabled;

  /// True if the item is selected by the user
  final bool isSelected;

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(logo.name),
        subtitle: Text(
          logo.id.toString(),
        ),
        leading: SizedBox(
          width: 50,
          child: FaIcon(
            FontAwesomeIcons.bedFront,
            color: context.colorScheme.primary,
          ),
        ),
        trailing: _getTrailingIcon(isSelected),
      );

  Widget _getTrailingIcon(bool isSelected) => isSelected
      ? FaIcon(
          FontAwesomeIcons.circleCheck,
          color: MaterialTheme.green.value,
        )
      : const SizedBox.shrink();
}

class _LogoBottomSheet extends StatefulWidget {
  const _LogoBottomSheet({
    required this.child,
  });

  final Widget child;

  @override
  State<_LogoBottomSheet> createState() => __LogoBottomSheetState();
}

class __LogoBottomSheetState extends State<_LogoBottomSheet> {
  late BottomSheetScrollCubit cubit;

  @override
  void initState() {
    cubit = context.read<BottomSheetScrollCubit>();
    cubit.pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PageView(
        controller: cubit.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          widget.child,
          Padding(
            padding: const EdgeInsets.all(20),
            child: const CreateLogoForm(),
          ),
        ],
      );
}
