import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../cubits/home_cubit.dart";

/// Home page of the application
///
/// This page is the first page that the user sees when opening the application
@RoutePage()
class HomePage extends StatelessWidget {
  /// Home page of the application
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocProvider(
          create: (context) => HomeCubit(),
          child: const Center(
            child: Text("Created with clean arq brick"),
          ),
        ),
      );
}
