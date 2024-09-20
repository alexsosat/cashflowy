import "package:flutter/material.dart";
import "package:auto_route/auto_route.dart";

import "package:flutter_bloc/flutter_bloc.dart";

import "../cubits/category_cubit.dart";

@RoutePage()
class CategoryPage extends StatelessWidget
{
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocProvider(
        create: (context) => CategoryCubit(),
        child: Center(
          child: Text("Created with clean arq brick"),
        ),
      ),
    );
  }
}
