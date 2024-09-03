import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

import "../../../core/constants/theme/app_separators.dart";
import "../../../core/extensions/theme_extension.dart";

/// [SplashPage] is the entry point of the application.
///
/// This widget is responsible for showing the splash screen of the application.
/// While the splash screen is shown, the application is loading the services
/// and making background calculations prior to show the user the data
@RoutePage()
class SplashPage extends StatelessWidget {
  /// [SplashPage] is the entry point of the application.
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.primaryColor,
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(),
              AppSeparators.vSmall,
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
}
