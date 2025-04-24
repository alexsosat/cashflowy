import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/overlays/overlays.dart';

/// Function to copy text to clipboard
Future copyToClipboard({
  required String title,
  required String textToCopy,
  required BuildContext context,
}) async {
  try {
    final data = ClipboardData(text: textToCopy);
    await Clipboard.setData(data);

    if (!context.mounted) return;

    showSnackBar(
      context: context,
      title: title,
      message: textToCopy,
    );
  } catch (e) {
    showSnackBar(
      context: context,
      message: "Error copying to clipboard: $e",
    );
  }
}
