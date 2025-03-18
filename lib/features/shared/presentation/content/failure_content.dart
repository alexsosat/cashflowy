import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

import "../../../../core/errors/failure.dart";
import "../../../../core/extensions/string_extension.dart";
import "../../../../core/extensions/theme_extension.dart";
import "../../../../core/localization/l10n.dart";
import "../helpers/get_error_animation.dart";

/// Widget that shows a [Failure] in a page.
///
/// Shows the user that an error occurred and allows them to retry the action.
class FailureContent extends StatelessWidget {
  /// Widget that shows a [Failure] in a page.
  ///
  /// Shows the user that an error occurred and allows them to retry the action.
  const FailureContent(
    this.failure, {
    super.key,
    this.onRetry,
  });

  /// The [Failure] to show in the page,
  final Failure failure;

  /// The [Function] to call when the user wants to retry the action.
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Lottie.asset(
                  getErrorAnimation(failure),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                      left: 25,
                      right: 25,
                    ),
                    child: Text(
                      failure.title,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 15,
                      left: 25,
                      right: 25,
                    ),
                    child: Text(
                      failure.message,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            if (onRetry != null)
              Flexible(
                flex: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    backgroundColor: context.colorScheme.primary,
                    foregroundColor: context.colorScheme.onPrimary,
                  ),
                  child: Text(
                    AppLocalizations.current.refreshPage.toCapitalized(),
                  ),
                  onPressed: () {
                    onRetry?.call();
                  },
                ),
              ),
          ],
        ),
      );
}
