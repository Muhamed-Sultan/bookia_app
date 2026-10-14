import 'package:bookie_app/core/routes/app_routes.dart';
import 'package:bookie_app/core/theme/app_colors.dart';
import 'package:bookie_app/core/theme/app_text_style.dart';
import 'package:bookie_app/core/widgets/app_botton.dart';
import 'package:bookie_app/core/widgets/custom_text_form_feild.dart';
import 'package:bookie_app/core/widgets/icon_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
              Text('Forgot Password?', style: AppTextStyle.mainText),
              10.verticalSpace,
              Text(
                'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                style: AppTextStyle.hintText,
              ),
              30.verticalSpace,
              CustomTextFormField(hintText: "Enter Your Email"),
              38.verticalSpace,
              AppBotton(
                title: 'Send Password',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.CreatNewPasswordScreen,
                  );
                },
              ),
              300.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.LoginScreen);
                    },
                    child: Text(
                      'Login Now',
                      style: AppTextStyle.hintText.copyWith(
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
