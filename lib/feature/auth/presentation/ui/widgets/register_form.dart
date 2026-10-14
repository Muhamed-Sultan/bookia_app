import 'package:bookie_app/core/routes/app_routes.dart';
import 'package:bookie_app/core/theme/app_colors.dart';
import 'package:bookie_app/core/theme/app_text_style.dart';
import 'package:bookie_app/core/utils/validator/validation.dart';
import 'package:bookie_app/core/widgets/app_botton.dart';
import 'package:bookie_app/core/widgets/custom_text_form_feild.dart';
import 'package:bookie_app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var conformPasswordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
        } else if (state is LoginSuccessState) {
          Navigator.pushNamed(context, AppRoutes.HomeScreen);
        } else {
          showDialog(
            context: context,
            builder: (context) => Center(child: Text('Login failed')),
          );
        }
      },
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: userNameController,
              validator: (v) {
                if (v == null) {
                  return 'User name is required';
                }
              },
              hintText: 'Username',
            ),
            15.verticalSpace,
            CustomTextFormField(
              controller: emailController,
              validator: (v) {
                if (v == null) {
                  return 'Email is required';
                }
                if (!Validation.isEmailValid(v ?? "")) {
                  return 'Please enter a valid email';
                }
              },
              hintText: 'Email',
            ),
            15.verticalSpace,
            CustomTextFormField(
              isPassword: true,
              controller: passwordController,
              validator: (v) {
                if (v == null) {
                  return 'Password is required';
                }
                if (!Validation.isPasswordValid(v ?? "")) {
                  return 'Please enter a valid password';
                }
              },
              hintText: 'Password',
            ),
            15.verticalSpace,
            CustomTextFormField(
              isPassword: true,
              controller: conformPasswordController,
              validator: (v) {
                if (v == null) {
                  return 'Conform Password is required';
                }
                if (!Validation.isPasswordValid(v ?? "")) {
                  return 'Please enter a valid Conform password';
                }
              },
              hintText: 'Conform Password',
            ),
            30.verticalSpace,
            AppBotton(
              title: 'Register',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.RegisterScreen);
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().register(
                    name: userNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                }
              },
            ),
            184.verticalSpace,
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
    );
  }
}
