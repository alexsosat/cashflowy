import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";

import "../../../../../core/extensions/string_extension.dart";
import "../../../../../core/extensions/theme_extension.dart";
import "../../../../../core/localization/l10n.dart";

/// Opens a loading overlay.
void showLoadingOverlay({
  required BuildContext context,
  String? message,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: context.colorScheme.surface.withOpacity(0.7),
    builder: (context) => _LoadingOverlay(
      message: message,
    ),
  );
}

/// Closes the loading overlay.
void hideLoadingOverlay({
  required BuildContext context,
}) =>
    Navigator.of(context).pop();

class _LoadingOverlay extends StatefulWidget {
  const _LoadingOverlay({
    this.message,
  });

  final String? message;

  @override
  State<_LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<_LoadingOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: 1900.ms,
      vsync: this,
    );

    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: true,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TODO: Replace CircularProgressIndicator with Lottie
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const CircularProgressIndicator(),
              ),
              // Lottie.asset(
              //   Assets.animations.loading,
              //   controller: _controller,
              //   repeat: true,
              //   width: 85,
              //   height: 85,
              // ),
              Visibility(
                visible: widget.message != null,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "${widget.message ?? AppLocalizations.current.loading.toCapitalized()}...",
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
