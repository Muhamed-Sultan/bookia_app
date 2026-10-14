import 'package:bookie_app/core/routes/app_routes.dart';
import 'package:bookie_app/core/theme/app_colors.dart';
import 'package:bookie_app/core/theme/app_text_style.dart';
import 'package:bookie_app/core/utils/validator/validation.dart';
import 'package:bookie_app/core/widgets/app_botton.dart';
import 'package:bookie_app/core/widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            validator: (v) {
              if (v == null) {
                return 'Email is required';
              }
              if (!Validation.isEmailValid(v ?? "")) {
                return 'Please enter a valid email';
              }
            },
            hintText: 'Enter your Email',
          ),
          15.verticalSpace,
          CustomTextFormField(
            isPassword: true,
            validator: (v) {
              if (v == null) {
                return 'Password is required';
              }
              if (!Validation.isPasswordValid(v ?? "")) {
                return 'Please enter a valid password';
              }
            },
            hintText: 'Enter your Password',
          ),
          13.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.ForgetPasswordScreen);
              },
              child: Text('Forget Password?', style: AppTextStyle.hintText),
            ),
          ),
          62.verticalSpace,
          AppBotton(
            title: 'Login',
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.RegisterScreen);
              formKey.currentState?.validate();
            },
          ),
          85.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?'),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.RegisterScreen);
                },
                child: Text(
                  'Register Now',
                  style: AppTextStyle.hintText.copyWith(
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
