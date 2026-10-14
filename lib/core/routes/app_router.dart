import 'package:bookie_app/feature/auth/presentation/ui/creat_new_password_screen.dart';
import 'package:bookie_app/feature/auth/presentation/ui/forget_password_screen.dart';
import 'package:bookie_app/feature/auth/presentation/ui/register_screen.dart';
import 'package:bookie_app/feature/welcome/presentation/ui/welcome_screen.dart';
import '../../feature/auth/presentation/ui/login_screen.dart';
import '../../feature/home/presentation/ui/home_screen.dart';
import 'app_routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.HomeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.WelcomeScreen:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case AppRoutes.LoginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.RegisterScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.ForgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case AppRoutes.CreatNewPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const CreatNewPasswordScreen(),
        );

      default:
        return null;
    }
  }
}
