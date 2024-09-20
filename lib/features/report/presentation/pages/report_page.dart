import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

import "package:flutter_bloc/flutter_bloc.dart";

import "../cubits/report_cubit.dart";

@RoutePage()
class ReportPage extends StatelessWidget
{
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocProvider(
        create: (context) => ReportCubit(),
        child: Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );
  }
}
