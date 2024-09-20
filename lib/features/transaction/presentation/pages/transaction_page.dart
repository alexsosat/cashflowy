import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

import "package:flutter_bloc/flutter_bloc.dart";

import "../cubits/transaction_cubit.dart";

@RoutePage()
class TransactionPage extends StatelessWidget
{
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocProvider(
        create: (context) => TransactionCubit(),
        child: Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );
  }
}
