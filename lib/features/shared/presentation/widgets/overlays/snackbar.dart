import "package:flutter/material.dart";

import "../../../../../core/extensions/theme_extension.dart";

/// Shows a bottom snackbar with the [title] and [message]
void showSnackBar({
  required BuildContext context,
  required String message,
  String? title,
  Duration duration = const Duration(seconds: 3),
}) {
  final colorScheme = Theme.of(context).colorScheme;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: context.theme.cardColor,
      duration: duration,
      elevation: 12,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Text(
              title,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.isDarkMode ? Colors.white : colorScheme.primary,
              ),
            ),
          Text(
            message,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.isDarkMode ? Colors.white : colorScheme.secondary,
            ),
          ),
        ],
      ),
    ),
  );
}
