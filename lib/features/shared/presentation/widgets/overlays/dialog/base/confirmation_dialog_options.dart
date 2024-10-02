import "confirmation_dialog.dart";

/// Options for the confirmation dialog.
class ConfirmationDialogOptions {
  /// Extra options for the confirmation dialog.
  const ConfirmationDialogOptions({
    this.type = DialogType.warning,
    this.barrierDismissible = true,
    this.showCancel = true,
  });

  /// The type of dialog to show.
  final DialogType type;

  /// True if the dialog is dismissible by tapping outside.
  final bool barrierDismissible;

  /// True if the dialog should show the cancel button.
  final bool showCancel;
}
