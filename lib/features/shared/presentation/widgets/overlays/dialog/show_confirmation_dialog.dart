import "package:flutter/material.dart";
import "../../../../../../core/errors/failure.dart";
import "../../../../../../core/extensions/failure_level_extension.dart";
import "base/confirmation_dialog.dart";
import "base/confirmation_dialog_options.dart";

/// Opens a confirmation dialog with a [title] and a [message]
/// inside the application.
///
/// The actions of the button are set in the [onCancel] and [onConfirm] parameters
Future<bool> showConfirmationDialog({
  required BuildContext context,
  required String title,
  String? message,
  ConfirmationDialogOptions options = const ConfirmationDialogOptions(),
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => ScaffoldMessenger(
      child: Builder(
        builder: (context) => ConfirmationDialog(
          barrierDismissible: options.barrierDismissible,
          title: title,
          type: options.type,
          message: message,
          showCancel: options.showCancel,
        ),
      ),
    ),
  );

  if (result == null) {
    return false;
  }

  return result;
}

/// Opens an error dialog with a [title] and a [message]
Future showWarningDialog({
  required BuildContext context,
  required String title,
  String? message,
  ConfirmationDialogOptions options = const ConfirmationDialogOptions(
    type: DialogType.warning,
    showCancel: false,
    barrierDismissible: false,
  ),
}) =>
    showConfirmationDialog(
      context: context,
      title: title,
      message: message,
      options: options,
    );

/// Opens an error dialog with a [title] and a [message]
Future showErrorDialog({
  required BuildContext context,
  required String title,
  String? message,
  ConfirmationDialogOptions options = const ConfirmationDialogOptions(
    type: DialogType.error,
    showCancel: false,
    barrierDismissible: false,
  ),
}) =>
    showConfirmationDialog(
      context: context,
      title: title,
      message: message,
      options: options,
    );

/// Shows a success dialog
Future showSuccessDialog({
  required BuildContext context,
  required String title,
  String? message,
  ConfirmationDialogOptions options = const ConfirmationDialogOptions(
    type: DialogType.success,
    showCancel: false,
    barrierDismissible: false,
  ),
}) =>
    showConfirmationDialog(
      context: context,
      title: title,
      message: message,
      options: options,
    );

/// Shows a dialog based on a Failure
Future showFailureDialog({
  required BuildContext context,
  required Failure failure,
}) =>
    showConfirmationDialog(
      context: context,
      title: failure.title,
      message: failure.message,
      options: ConfirmationDialogOptions(
        type: failure.level.toDialogType(),
        showCancel: false,
        barrierDismissible: true,
      ),
    );
