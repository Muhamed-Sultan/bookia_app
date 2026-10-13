import 'package:flutter/material.dart';

import '../../feature/auth/presention/ui/login_screen.dart';
import '../../feature/home/presention/ui/home_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homescreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppRoutes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return null;
    }
  }
}
