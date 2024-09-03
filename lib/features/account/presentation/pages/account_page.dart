import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";

/// Page to show the account data
@RoutePage()
class AccountPage extends StatelessWidget {
  /// Page to show the account data
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text("Created with clean arq brick"),
        ),
      );
}
