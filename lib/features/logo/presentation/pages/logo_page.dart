import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

import "package:flutter_bloc/flutter_bloc.dart";

import "../cubits/logo_cubit.dart";

@RoutePage()
class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LogoCubit(),
        child: Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );
  }
}
