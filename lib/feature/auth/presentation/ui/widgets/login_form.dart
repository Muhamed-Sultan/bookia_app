import 'package:bookia_app/core/routes/app_routes.dart';
import 'package:bookia_app/core/theme/app_colors.dart';
import 'package:bookia_app/core/theme/app_text_style.dart';
import 'package:bookia_app/core/utils/validator/validation.dart';
import 'package:bookia_app/core/widgets/app_botton.dart';
import 'package:bookia_app/core/widgets/custom_text_form_feild.dart';
import 'package:bookia_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.transparent,
              content: Center(child: CircularProgressIndicator()),
            ),
          );
        } else if (state is LoginSuccessState) {
          Navigator.pushNamed(context, AppRoutes.AppBottonNavBar);
        } else {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Login failed'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: emailController,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Email is required';
                }
                if (!Validation.isEmailValid(v)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              hintText: 'Enter your Email',
            ),
            15.verticalSpace,
            CustomTextFormField(
              controller: passwordController,
              isPassword: true,
              validator: (v) {
                if (v == null) {
                  return 'Password is required';
                }
                if (!Validation.isPasswordValid(v)) {
                  return 'Please enter a valid password';
                }
                return null;
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
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                }
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
      ),
    );
  }
}
