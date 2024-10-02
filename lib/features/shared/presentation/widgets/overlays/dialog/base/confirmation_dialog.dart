import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:lottie/lottie.dart";

import "../../../../../../../core/assets/assets.gen.dart";
import "../../../../../../../core/extensions/string_extension.dart";
import "../../../../../../../core/extensions/theme_extension.dart";
import "../../../../../../../core/localization/l10n.dart";
import "vertical_stack.dart";

/// Dialog overlay whice presents a confirm and cancel button.
///
/// Returns true if the user confirms the action, false otherwise.
class ConfirmationDialog extends StatelessWidget {
  /// Dialog overlay whice presents a confirm and cancel button.
  ///
  /// Returns true if the user confirms the action, false otherwise.
  const ConfirmationDialog({
    required this.title,
    super.key,
    this.message,
    this.type = DialogType.warning,
    this.barrierDismissible = false,
    this.showCancel = true,
  });

  /// The title of the dialog.
  final String title;

  /// The message to show in the dialog.
  final String? message;

  /// The type of dialog to show.
  final DialogType type;

  /// True if the dialog is dismissible by tapping outside.
  final bool barrierDismissible;

  /// True if the dialog should show the cancel button.
  final bool showCancel;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: PopScope(
          canPop: barrierDismissible,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (barrierDismissible) {
                Navigator.of(context).pop(false);
              }
            },
            child: Center(
              child: Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  ),
                  ScaleEffect(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  ),
                ],
                child: VerticalStack(
                  dialogBackgroundColor: context.theme.cardColor,
                  header: Lottie.asset(
                    type.animation,
                    repeat: type.repeat,
                  ),
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      if (message != null) ...[
                        const SizedBox(height: 10),
                        Text(
                          message ?? "",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  btnOk: _PillButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    color: const Color(0xFF00CA71),
                    padding: 10,
                    child: Text(
                      AppLocalizations.current.confirm.toCapitalized(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  btnCancel: showCancel
                      ? _PillButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          color: Colors.grey,
                          padding: 10,
                          child: Text(
                            AppLocalizations.current.cancel.toCapitalized(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
      );
}

/// Extension to get the animation and repeat properties of a dialog type.
extension DialogTypeExtension on DialogType {
  /// Returns the animation path to show in the dialog.
  String get animation => switch (this) {
        DialogType.info => Assets.animations.dialog.info,
        DialogType.error => Assets.animations.dialog.error,
        DialogType.success => Assets.animations.dialog.success,
        DialogType.warning => Assets.animations.dialog.warning,
      };

  /// Returns true if the animation should repeat.
  bool get repeat => switch (this) {
        DialogType.info => true,
        DialogType.error => false,
        DialogType.success => false,
        DialogType.warning => false,
      };
}

/// The type of dialog to show.
enum DialogType {
  /// A dialog to show the user an action has been done successfully.
  success,

  /// A dialog showing information to the user.
  info,

  /// A dialog to show the user an error ocurred during the transaction.
  error,

  /// A dialog to warn the user before doing a transaction.
  warning,
}

class _PillButton extends StatelessWidget {
  const _PillButton({
    required this.onPressed,
    required this.child,
    this.color,
    this.padding = 10,
  });

  /// Method executed when this button is pressed
  final Function() onPressed;

  /// The button filled color
  final Color? color;

  /// The content inside the button
  final Widget child;

  /// The padding surrounding the content
  final double padding;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: EdgeInsets.all(padding),
          backgroundColor: color ?? context.colorScheme.primary,
          foregroundColor: context.colorScheme.onPrimary,
        ),
        child: child,
      );
}
