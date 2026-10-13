import 'package:bookie_app/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/ui/login_screen.dart';
import '../../feature/home/presentation/ui/home_screen.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homescreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AppRoutes.welcomescreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case AppRoutes.loginscreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return null;
    }
  }
}
