import 'package:bookia_app/core/widgets/app_botton_nav_bar.dart';
import 'package:bookia_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/feature/auth/presentation/ui/create_new_password_screen.dart';
import 'package:bookia_app/feature/auth/presentation/ui/forget_password_screen.dart';
import 'package:bookia_app/feature/auth/presentation/ui/register_screen.dart';
import 'package:bookia_app/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia_app/feature/home/presentation/ui/search_screen.dart';
import 'package:bookia_app/feature/welcome/presentation/ui/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(),
            child: const LoginScreen(),
          ),
        );
      case AppRoutes.RegisterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthCubit(),
            child: const RegisterScreen(),
          ),
        );
      case AppRoutes.ForgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case AppRoutes.CreateNewPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const CreateNewPasswordScreen(),
        );
      case AppRoutes.AppBottonNavBar:
        return MaterialPageRoute(builder: (_) => const AppBottomNavBar());
      case AppRoutes.SearchScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit()..search(""),
            child: const SearchScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
