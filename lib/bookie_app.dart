import 'package:bookie_app/core/routes/app_router.dart';
import 'package:bookie_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class BookieApp extends StatelessWidget {
  const BookieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.homescreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
