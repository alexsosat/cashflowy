import "dart:io";

import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../core/routes/app_router.gr.dart";
import "../../../../core/services/local_notifications/local_notifications_service.dart";
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
        appBar: AppBar(
          title: const Text("Home"),
          actions: [
            if (Platform.isAndroid)
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () => context.router.push(
                  const AppNotificationListRoute(),
                ),
              ),
          ],
        ),
        body: BlocProvider(
          create: (context) => HomeCubit(),
          child: Center(
            child: ElevatedButton(
              onPressed: _sendNotification,
              child: const Text("Send notification"),
            ),
          ),
        ),
      );

  void _sendNotification() {
    LocalNotificationsService.showNotification(
      body:
          r"💸Consumiste $ 311.00 en COSTCO MONTERREY SAN P GARZA G000MX con tu tarjeta de crédito",
    );
  }
}
