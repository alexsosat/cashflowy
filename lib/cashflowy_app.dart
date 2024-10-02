import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";

import "core/constants/theme/material_theme.dart";
import "core/constants/theme/util.dart";
import "core/localization/l10n.dart";
import "core/routes/app_router.dart";

final _appRouter = AppRouter();

/// [CashflowyApp] is the entry point of the application.
class CashflowyApp extends StatelessWidget {
  /// [CashflowyApp] is the entry point of the application.
  const CashflowyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: "Cashflowy",
        debugShowCheckedModeBanner: false,

        //Theming
        themeMode: ThemeMode.system,
        theme: MaterialTheme(
          createTextTheme(context, "Poppins", "Poppins"),
        ).light(),
        darkTheme: MaterialTheme(
          createTextTheme(context, "Poppins", "Poppins"),
        ).dark(),

        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        supportedLocales: AppLocalizations.delegate.supportedLocales,

        routerConfig: _appRouter.config(),
      );
}
