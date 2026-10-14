import 'package:bookie_app/core/routes/app_routes.dart';
import 'package:bookie_app/core/theme/app_colors.dart';
import 'package:bookie_app/core/theme/app_text_style.dart';
import 'package:bookie_app/core/widgets/icon_back.dart';
import 'package:bookie_app/feature/auth/presentation/ui/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconBack(),
              29.verticalSpace,
              Text(
                'Welcome back! Glad to see you, Again!',
                style: AppTextStyle.mainText,
              ),
              32.verticalSpace,
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
